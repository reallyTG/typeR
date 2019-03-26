library(move)


### Name: spTransform
### Title: Transform projection of movement track
### Aliases: spTransform spTransform,Move,character-method
###   spTransform,Move,missing-method

### ** Examples

## create a Move object
data(leroy)
## transform the Move object by default into "+aeqd" projection method 
## and center the coordinate system
spTransform(leroy, center=TRUE)

## transform the Move object into another projection method, like mollweide
spTransform(leroy, CRSobj="+proj=moll +ellps=WGS84")

##check projection method
proj4string(leroy)
## Don't show: 
spTransform(leroy, CRSobj=CRS("+proj=moll +ellps=WGS84"))
data(fishers)
spTransform(fishers, center=TRUE)
## End(Don't show)



