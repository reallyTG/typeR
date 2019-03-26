library(move)


### Name: points
### Title: Plotting the points of a track
### Aliases: points points,.MoveTrackSingle-method
###   points,.MoveTrackStack-method points,.MoveTrackSingleBurst-method

### ** Examples

## add a track from a Move object to a plot
data(leroydbbmm)
data(leroy)
plot(leroydbbmm)
points(spTransform(leroy, center=TRUE), col=3) # add a track from a Move object to a plot

## plot a moveStack object
data(fishers)
plot(fishers, type="l")
points(fishers, col=3:4, pch=4) 




