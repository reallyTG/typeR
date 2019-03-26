library(move)


### Name: plotBursts
### Title: Plotting the centroids of a bursted track
### Aliases: plotBursts plotBursts,list-method
###   plotBursts,.MoveTrackSingleBurst-method

### ** Examples

data(leroy)
behav <- c(rep(1:4,each=200), rep(5, 118))
testb <- burst(leroy, f=behav)
plot(coordinates(leroy),type="l")
plotBursts(testb, breaks=3, add=TRUE, pch=19)
plotBursts(testb, breaks=5, add=FALSE, pch=19, col=rainbow(5))

## plotting circle size of a moveBurst track by realtive segment length
plotBursts(object=testb, breaks=3, sizeFUN=function(x){sum(distance(x))}, pch=19, add=FALSE)




