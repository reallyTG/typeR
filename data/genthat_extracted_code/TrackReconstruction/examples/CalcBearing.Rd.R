library(TrackReconstruction)


### Name: CalcBearing
### Title: Calculate Bearing
### Aliases: CalcBearing
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Bearing to Los Angeles from New York
Bearing<-CalcBearing(40.7697,-73.9735,34.0522,-118.2428)
Bearing
Bearing*360/(2*pi) #transform radians to degrees



