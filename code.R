# Libraries
library(dplyr)
library(ggplot2)
library(raster)
library(maptools)
library(rgeos)

# Load data
if('cleaned_data.RData' %in% dir()){
  load('cleaned_data.RData')
} else {
  # Data
  load('Proc_Mosq_data_20012016.RData')
  # Get spatial
  #####
  # GET SPATIAL DATA
  moz3 <- getData('GADM', country = 'MOZ', level = 3)
  maputo <- moz3[moz3@data$NAME_1 %in% c('Maputo', 'Maputo City'),]
  # Fortify maputo
  maputo_fortified <- fortify(maputo, region = 'NAME_3')
  # Fortify moz3
  moz3_fortified <- fortify(moz3, region = 'NAME_3')
  save.image('cleaned_data.RData')
}
