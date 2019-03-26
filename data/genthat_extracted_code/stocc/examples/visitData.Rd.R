library(stocc)


### Name: visitData
### Title: Simulated occupancy survey data
### Aliases: visitData
### Keywords: datasets

### ** Examples

data(visitData)
data(occupancyData)
##
## Blue points represent visited sites and green circles represent confirmed occupancy.
##
image(x=seq(0.5,39.5,1), y=seq(0.5,39.5,1), z=t(matrix(occupancyData$psi,40)),
	xlab="x", ylab="y", main="Occupancy process with visits")
points(visitData$x[visitData$obs==1], visitData$y[visitData$obs==1], col="green")
points(visitData$x, visitData$y, col="blue", pch=20, cex=0.25)



