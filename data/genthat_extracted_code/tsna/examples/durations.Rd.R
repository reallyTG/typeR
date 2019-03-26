library(tsna)


### Name: duration
### Title: Compute Observed Activity Durations or Event Counts for Edges or
###   Vertices
### Aliases: duration edgeDuration vertexDuration

### ** Examples


# look at the distributions of edge durations for
# a real-world contact network
## Not run: 
##D require(networkDynamicData)
##D data(hospital_contact)
##D summary(edgeDuration(hospital,subject='edges'))
##D summary(edgeDuration(hospital,mode='counts',subject='edges'))
## End(Not run)
# look at the vertex durations for a network were 
# vertices are not present every day
require(networkDynamic)
data(windsurfers)
vertexDuration(windsurfers)



