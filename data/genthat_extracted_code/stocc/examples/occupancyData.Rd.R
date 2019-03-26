library(stocc)


### Name: occupancyData
### Title: Simulated occupancy for the 40 x 40 study area.
### Aliases: occupancyData

### ** Examples

data(occupancyData)
##
## Blue points represent realized occupancy.
##
image(x=seq(0.5,39.5,1), y=seq(0.5,39.5,1), z=t(matrix(occupancyData$psi,40)),
	xlab="x", ylab="y", main="Occupancy process with realized occupancy")
points(occupancyData$x[occupancyData$occ==1], occupancyData$y[occupancyData$occ==1],
 pch=20, cex=0.25, col="blue")



