library(move)


### Name: hrBootstrap
### Title: Calculates and plots the area of the Minimum Convex Polygon of a
###   track
### Aliases: hrBootstrap hrBootstrap,SpatialPoints-method
###   hrBootstrap,.MoveTrackStack-method

### ** Examples

## for a Move object
  m <- move(x=rnorm(55), y=rnorm(55), time=as.POSIXct(1:55, origin="1970-1-1"), 
	          proj=CRS("+proj=aeqd +ellps=WGS84"), animal='a')    
  hrBootstrap(m,rep=5, level=99, unout="m2", plot=TRUE)

## for a MoveStack object
   m2 <- move(x=rnorm(30), y=rnorm(30), time=as.POSIXct(1:30, origin="1970-1-1"), 
	           proj=CRS("+proj=aeqd +ellps=WGS84"), animal='b') 
  mstack <- moveStack(list(m[30:50,],m2))
  hrBootstrap(mstack,rep=5, unout="m2", plot=FALSE) 

## for a SpatialPoints object
  hrBootstrap(as(m,"SpatialPoints"),rep=5, unout="m2", plot=TRUE) 



