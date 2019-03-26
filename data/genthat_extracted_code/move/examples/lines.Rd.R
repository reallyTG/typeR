library(move)


### Name: lines
### Title: Plotting the lines of a track
### Aliases: lines lines,.MoveTrackSingle-method
###   lines,.MoveTrackStack-method lines,.MoveTrackSingleBurst-method

### ** Examples

## add a track from a Move object to a plot
data(leroy)
data(leroydbbmm)
plot(leroydbbmm)
lines(spTransform(leroy, center=TRUE), col=3)

## plot the points and lines of a moveStack
data(fishers)
plot(fishers, type='p',pch=4)
lines(fishers, col=3:4)



