library(spatstat)


### Name: cut.ppp
### Title: Classify Points in a Point Pattern
### Aliases: cut.ppp
### Keywords: spatial methods

### ** Examples

 # (1) cutting based on numeric marks of point pattern
 
 trees <- longleaf
 # Longleaf Pines data
 # the marks are positive real numbers indicating tree diameters.

 ## Don't show: 
	# smaller dataset
	trees <- trees[seq(1, npoints(trees), by=80)]
 
## End(Don't show)
 ## Not run: 
##D  plot(trees)
##D  
## End(Not run)

 # cut the range of tree diameters into three intervals
 long3 <- cut(trees, breaks=3)
 ## Not run: 
##D  plot(long3)
##D  
## End(Not run)

 # adult trees defined to have diameter at least 30 cm
 long2 <- cut(trees, breaks=c(0,30,100), labels=c("Sapling", "Adult"))
 plot(long2)
 plot(long2, cols=c("green","blue"))

 # (2) cutting based on another numeric vector
 # Divide Swedish Pines data into 3 classes
 # according to nearest neighbour distance

 swedishpines
 plot(cut(swedishpines, nndist(swedishpines), breaks=3))

 # (3) cutting based on tessellation
 # Divide Swedish Pines study region into a 4 x 4 grid of rectangles
 # and classify points accordingly

 tes <- tess(xgrid=seq(0,96,length=5),ygrid=seq(0,100,length=5))
 plot(cut(swedishpines, tes))
 plot(tes, lty=2, add=TRUE)

 # (4) multivariate marks
 finpines
 cut(finpines, "height", breaks=4)



