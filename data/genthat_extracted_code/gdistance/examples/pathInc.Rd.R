library(gdistance)


### Name: pathInc
### Title: Incidence of paths from a common origin: overlap and non-overlap
### Aliases: pathInc
###   pathInc,TransitionLayer,Coords,Coords,missing,missing,missing-method
###   pathInc,TransitionLayer,Coords,Coords,missing,numeric,missing-method
###   pathInc,TransitionLayer,Coords,Coords,missing,missing,Transition-method
###   pathInc,TransitionLayer,Coords,Coords,missing,numeric,Transition-method
###   pathInc,TransitionLayer,Coords,Coords,Coords,missing,missing-method
###   pathInc,TransitionLayer,Coords,Coords,Coords,numeric,missing-method
###   pathInc,TransitionLayer,Coords,Coords,Coords,missing,Transition-method
###   pathInc,TransitionLayer,Coords,Coords,Coords,numeric,Transition-method
### Keywords: spatial

### ** Examples

#Create TransitionLayer
r <- raster(ncol=36,nrow=18)
r <- setValues(r,rep(1,times=ncell(r)))
tr <- transition(r,mean,directions=4)

#Two different types of correction are required
trR <- geoCorrection(tr, type="r", multpl=FALSE)
trC <- geoCorrection(tr, type="c", multpl=FALSE)

#Create TransitionStack
ts <- stack(trR, trR)

#Points for origin and coordinates between which to calculate path (non)overlaps
sP0 <- SpatialPoints(cbind(0,0))
sP1 <- SpatialPoints(cbind(c(65,5,-65),c(-55,35,-35)))

#Randomised shortest paths
#rescaling is needed: exp(-theta * trC) should give reasonable values
trC <- trC / median(transitionMatrix(trC)@x) #divide by median of the non-zero values
pathInc(trC, origin=sP0, from=sP1, theta=2)

#Random walk
pathInc(trR, origin=sP0, from=sP1)

#TransitionStack as weights
pathInc(trR, origin=sP0, from=sP1, weight=ts)

#Demonstrate use of an alternative function
#The current default is to take the minimum of each pair of layers

altoverlap <- function(a, b)
{
	aV <- as.vector(a[,rep(1:ncol(a), each=ncol(b))])
	bV <- as.vector(b[,rep(1:ncol(b), times=ncol(a))])
	result <- matrix(aV * bV, nrow = nrow(a), ncol=ncol(a)*ncol(b))
	return(result)
}

pathInc(trR, origin=sP0, from=sP1, weight=ts, functions=list(altoverlap))




