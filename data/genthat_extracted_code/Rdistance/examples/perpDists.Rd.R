library(Rdistance)


### Name: perpDists
### Title: Compute off-transect distances from sighting distances and
###   angles
### Aliases: perpDists

### ** Examples

# Load the example dataset of sparrow detections from package
data(sparrowDetectionData)
# Compute perpendicular, off-transect distances from the observer's sight distance and angle
sparrowDetectionData$perpDist <- perpDists(sightDist="sightdist", sightAngle="sightangle",
                                           data=sparrowDetectionData)



