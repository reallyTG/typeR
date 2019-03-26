library(trip)


### Name: trackDistance
### Title: Determine distances along a track
### Aliases: trackDistance trackDistance.default trackDistance.trip

### ** Examples

  ## Continuing the example from '?"trip-methods"':
utils::example("trip-methods", package="trip",
               ask=FALSE, echo=FALSE)

 ## the method knows this is a trip, so there is a distance for every
 ## point, including 0s as the start and at transitions between
 ## individual trips
trackDistance(tr)

## the default method does not know about the trips, so this is
##(n-1) distances between all points
## trackDistance(coordinates(tr), longlat = FALSE)

## we get NA at the start, end and at transitions between trips

 ## Not run: 
##D  require(rgdal)
##D  trackAngle(tr)
##D  
## End(Not run)



