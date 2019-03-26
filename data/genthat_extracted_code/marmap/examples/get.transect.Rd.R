library(marmap)


### Name: get.transect
### Title: Compute approximate cross section along a depth transect
### Aliases: get.transect

### ** Examples

	
# load datasets
	data(nw.atlantic); as.bathy(nw.atlantic) -> atl
	data(nw.atlantic.coast)

# Example 1. get.transect(), without use of locator()
	get.transect(atl, -65, 43,-59,40) -> test ; plot(test[,3]~test[,2],type="l")
	get.transect(atl, -65, 43,-59,40, distance=TRUE) -> test ; plot(test[,4]~test[,3],type="l")

# Example 2. get.transect(), without use of locator(); pretty plot
	par(mfrow=c(2,1),mai=c(1.2, 1, 0.1, 0.1))
	plot(atl, deep=-6000, shallow=-10, step=1000, lwd=0.5, col="grey50",drawlabels=TRUE)
	lines(nw.atlantic.coast)

	get.transect(atl, -75, 44,-46,32, loc=FALSE, dis=TRUE) -> test
	points(test$lon,test$lat,type="l",col="blue",lwd=2,lty=2)
	plotProfile(test)

# Example 3. get.transect(), with use of locator(); pretty plot
## Not run: 
##D 	par(mfrow=c(2,1),mai=c(1.2, 1, 0.1, 0.1))
##D 	plot(atl, deep=-6000, shallow=-10, step=1000, lwd=0.5, col="grey50",drawlabels=TRUE)
##D 	lines(nw.atlantic.coast)
##D 	
##D 	get.transect(atl, loc=TRUE, dis=TRUE, col=2, lty=2) -> test
##D 	plotProfile(test)
##D 	
## End(Not run)



