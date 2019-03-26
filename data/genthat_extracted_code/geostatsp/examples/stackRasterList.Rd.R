library(geostatsp)


### Name: stackRasterList
### Title: Converts a list of rasters, possibly with different projections
###   and resolutions, to a single raster stack.
### Aliases: stackRasterList spdfToBrick

### ** Examples


mylist = list(a=raster(matrix(1:9, 3, 3), 0,1,0,1, 
       crs="+proj=utm +zone=17 +ellps=GRS80 +units=m +no_defs"),
	b=raster(matrix(1:25, 5, 5), -1, 2, -1, 2,
	   crs="+proj=utm +zone=17 +ellps=GRS80 +units=m +no_defs")
	)
mystack = stackRasterList(mylist)
mystack



mylist = list(a=raster(matrix(1:36, 6, 6,byrow=TRUE), 0,1000,0,1000, 
       crs="+proj=utm +zone=17 +ellps=GRS80 +units=m +no_defs"),
	b=raster(matrix(1:144, 12, 12), -85.49, -85.48, 0, 0.01,
	   crs="+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs "),
	c=raster(matrix(1:100, 10, 10), -5000,5000,-5000,5000, 
       crs="+proj=utm +zone=17 +ellps=GRS80 +units=m +no_defs")
	)
	
if(.Platform$OS.type=='unix' & require('rgdal', quietly=TRUE)) {	
	mystack = stackRasterList(mylist,mc.cores=2)
	mystack
}

plot(mystack[["b"]], main="stack b")
plot(mystack[['a']],add=TRUE,col=grey(seq(0,1,len=12)),alpha=0.8,legend=FALSE)




