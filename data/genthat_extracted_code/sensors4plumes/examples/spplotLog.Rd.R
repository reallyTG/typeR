library(sensors4plumes)


### Name: spplotLog
### Title: Plot methods for spatial data with logarithmic scale
### Aliases: spplotLog

### ** Examples

data(SPixelsDF)
data(SPointsDF)
# add arbitrary data to show the effect of different values (< 0, == 0, small, big)
SPixelsDF@data$a = c(-5, 0, 0.003, 10, 57, 320, 444, 1000, 10000)
# replace 0 and small values
spplotLog(SPixelsDF, replace0 = TRUE, minNonzero = 0.05)
# choose base an number of ticks manually; forward parameters to spplot
spplotLog(SPixelsDF, base = 5, nTicks = 20,
          col.regions = heat.colors,
          sp.layout = list("sp.points", SPointsDF[1,]))



