library(quickPlot)


### Name: getColors
### Title: Get and set colours for plotting 'Raster*' objects
### Aliases: getColors getColours getColors,Raster-method
###   getColors,ANY-method getColors,SpatialPoints-method setColors<-
###   setColours setColors<-,RasterLayer,numeric,character-method
###   setColors<-,RasterLayer,missing,character-method
###   setColors<-,RasterStack,numeric,list-method
###   setColors<-,Raster,missing,list-method setColors
###   setColors,RasterLayer,character,numeric-method
###   setColors,RasterLayer,character,missing-method

### ** Examples

library(igraph)
library(raster)

ras <- raster(matrix(c(0, 0, 1, 2), ncol = 2, nrow = 2))

getColors(ras) ## none

# Use replacement method
setColors(ras, n = 3) <- c("red", "blue", "green")
getColors(ras)

clearPlot()
Plot(ras)

# Use function method
ras <- setColors(ras, n = 3, c("red", "blue", "yellow"))
getColors(ras)

clearPlot()
Plot(ras)

# Using the wrong number of colors, e.g., here 2 provided,
# for a raster with 3 values... causes interpolation, which may be surprising
ras <- setColors(ras, c("red", "blue"))
clearPlot()
Plot(ras)

# Real number rasters - interpolation is used
ras <- raster(matrix(runif(9), ncol = 3, nrow = 3)) %>%
  setColors(c("red", "yellow")) # interpolates when real numbers, gives warning

clearPlot()
Plot(ras)

# Factor rasters, can be contiguous (numerically) or not, in this case not:
ras <- raster(matrix(sample(c(1, 3, 6), size = 9, replace = TRUE), ncol = 3, nrow = 3))
levels(ras) <- data.frame(ID = c(1, 3, 6), Names = c("red", "purple", "yellow"))
ras <- setColors(ras, n = 3, c("red", "purple", "yellow"))
getColors(ras)

clearPlot()
Plot(ras)

# if a factor raster, and not enough labels are provided, then a warning
#   will be given, and colors will be interpolated
#   The level called purple is not purple, but interpolated betwen red and yellow
suppressWarnings({
  ras <- setColors(ras, c("red", "yellow"))
  clearPlot()
  Plot(ras)
})

# use RColorBrewer colors
setColors(ras) <- "Reds"
clearPlot()
Plot(ras)



