library(move)


### Name: plot
### Title: Plotting track or raster
### Aliases: plot plot,.MoveTrackSingle,missing-method
###   plot,.MoveTrackStack,missing-method
###   plot,.MoveTrackSingleBurst,missing-method

### ** Examples

data(leroy)
data(fishers)
plot(leroy) # plot a Move object
plot(leroy, type="o", col=3)
plot(fishers, col=c(3,5), lwd=3) # plot a MoveStack object
plot(fishers, type="l", col=c(3,5), lwd=3)

data(dbbmmstack)
data(leroydbbmm)
plot(leroydbbmm) # plot the raster of a DBBMM object
plot(dbbmmstack) # plot the raster of a DBBMMStack object



