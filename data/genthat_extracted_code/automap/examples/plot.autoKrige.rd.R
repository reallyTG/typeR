library(automap)


### Name: plot.autoKrige
### Title: Plot methods in automap
### Aliases: plot.autoKrige plot.posPredictionInterval

### ** Examples

# Ordinary kriging
data(meuse)
coordinates(meuse) =~ x+y
data(meuse.grid)
gridded(meuse.grid) =~ x+y

kriging_result = autoKrige(log(zinc)~1, meuse, meuse.grid)
# Adding the sp.layout parameter shows the locations of the measurements
plot(kriging_result, sp.layout = list(pts = list("sp.points", meuse)))



