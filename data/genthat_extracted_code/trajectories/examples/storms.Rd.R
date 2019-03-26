library(trajectories)


### Name: storms
### Title: Storm trajectories
### Aliases: storms
### Keywords: datasets

### ** Examples

data(storms)
dim(storms)
plot(storms)
x = approxTracksCollection(storms, by = "30 min", FUN = spline)
plot(x, col = 'red', add = TRUE)
## Not run: 
##D demo(storms) # regenerates these data from their source
## End(Not run)



