library(gstat)


### Name: vgm.panel.xyplot
### Title: panel functions for most of the variogram plots through lattice
### Aliases: vgm.panel.xyplot panel.pointPairs
### Keywords: models

### ** Examples
 
library(sp)
data(meuse)
coordinates(meuse) <- c("x", "y")
library(lattice)
mypanel = function(x,y,...) { 
	vgm.panel.xyplot(x,y,...)
	panel.abline(h=var(log(meuse$zinc)), color = 'red')
}
plot(variogram(log(zinc)~1,meuse), panel = mypanel)



