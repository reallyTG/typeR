library(SDMPlay)


### Name: delim.area
### Title: RasterStack preparation for modelling
### Aliases: delim.area

### ** Examples

data('predictors2005_2012')
envi <- predictors2005_2012

r <- SDMPlay:::delim.area(predictors = envi,
longmin = 70,longmax = 75, latmin = -50,latmax = -40,interval = c(0,-1000))
r

library(grDevices) # plot the result with nice colors
palet.col <- colorRampPalette(c('deepskyblue','green','yellow', 'red'))(80)
raster::plot(r, col=palet.col)



