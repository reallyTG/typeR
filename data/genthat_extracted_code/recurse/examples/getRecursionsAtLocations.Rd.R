library(recurse)


### Name: getRecursionsAtLocations
### Title: Calculates recursion information from the trajectory for
###   specific locations
### Aliases: getRecursionsAtLocations getRecursionsAtLocations.data.frame
###   getRecursionsAtLocations.Move getRecursionsAtLocations.MoveStack

### ** Examples

data(martin)
locations = data.frame(x = c(-10, 0, 20), y = c(5, 0, 0))
revisits = getRecursionsAtLocations(martin, locations, radius = 1)
plot(revisits, locations, legendPos = c(10, -15), 
     alpha = 1, pch = 17, xlim = range(martin$x), ylim = range(martin$y))
points(martin$x, martin$y, pch = ".", col = "gray50")
drawCircle(10, -10, 1)




