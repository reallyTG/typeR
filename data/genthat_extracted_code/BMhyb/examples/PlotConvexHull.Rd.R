library(BMhyb)


### Name: PlotConvexHull
### Title: Convex hull
### Aliases: PlotConvexHull

### ** Examples

	# Create a set of random data to plot convex hull around
	x<-rnorm(100,0.8,0.3)
	y<- rnorm(100,0.8,0.3)
	#get max and min of all x and y data for nice plotting
	xrange<-range(x)
	yrange<-range(y)
	#plot it up!
	plot(x,y,type="p",pch=1,col='black',xlim=c(xrange),ylim=c(yrange))
	PlotConvexHull(xcoord=x,ycoord=y,lcolor='red')
	


