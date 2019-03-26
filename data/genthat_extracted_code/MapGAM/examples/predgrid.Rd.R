library(MapGAM)


### Name: predgrid
### Title: Create a Grid and Clip It to a Map and Data Bounds
### Aliases: predgrid
### Keywords: misc

### ** Examples

# define a rectangular 100x100 grid covering the MA data 
data(MAdata)
gamgrid <- predgrid(MAdata)
# plot the grid points
plot(gamgrid$Xcoord, gamgrid$Ycoord, cex=0.1, col="red")
# and the data locations
points(MAdata$Xcoord,MAdata$Ycoord)

# But that grid extends beyond the state boundaries and into the ocean!
# Better to also clip the grid to a map of MA using the following code
# which requires the PBSmapping package:
if (require(PBSmapping)) {
# Clip a 50x50 grid covering the MA data to a map of MA 
data(MAmap)
gamgrid2 <- predgrid(MAdata, map=MAmap, nrow=50, ncol=50)
# plot the MA map and grid points
plot(MAmap)
points(gamgrid2, cex=0.1, col="red")
}



