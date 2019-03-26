library(automap)


### Name: posPredictionInterval
### Title: Determines the position of the p% prediction interval
### Aliases: posPredictionInterval

### ** Examples

data(meuse)
coordinates(meuse) =~ x+y
data(meuse.grid)
gridded(meuse.grid) =~ x+y

kriging_result = autoKrige(zinc~1, meuse, meuse.grid)
pos = posPredictionInterval(kriging_result, 95, 75)
plot(pos)



