library(RchivalTag)


### Name: plot_geopos
### Title: plot geolocation estimates derived from archival tagging data
### Aliases: plot_geopos

### ** Examples

## example 1a) line plot from csv-file:
csv_file <- system.file("example_files/15P1019-104659-1-GPE3.csv",package="RchivalTag")
plot_geopos(csv_file, type='l', add=FALSE) ## show tracks as line plot

## example 1b) scatter plot from csv-file on existing landmask:
require('oceanmap')
plotmap('lion') ## use keyword to derive area limits
plot_geopos(csv_file, add=TRUE) ## show tracks as scatter plot

## example 1c) scatter plot from csv-file on existing landmask:
require('oceanmap')
plotmap('lion') ## use keyword to derive area limits
pos <- read.csv(csv_file, header = TRUE, sep = ",", skip = 5)
plot_geopos(file="",pos=pos, add=TRUE) ## show tracks as scatter plot


## example 2) probability surfaces of horizontal tracks from nc-file:
## this can take some time as it inlcudes time consuming data processing
nc_file <- system.file("example_files/15P1019-104659-1-GPE3.nc",package="RchivalTag") 
# plot_geopos(nc_file)




