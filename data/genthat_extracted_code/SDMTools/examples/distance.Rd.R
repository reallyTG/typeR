library(SDMTools)


### Name: distance
### Title: Vincenty Direct Calculation of Distance and Direction
### Aliases: distance

### ** Examples

#get the distance of 1 degree longitude at each 5 degrees latitude from -90 to 90
distance(lat1=seq(-90,90,5),lon1=rep(0,37),lat2=seq(-90,90,5),lon2=rep(1,37),bearing=TRUE)



