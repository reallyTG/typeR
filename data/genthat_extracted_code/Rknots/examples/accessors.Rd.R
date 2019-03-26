library(Rknots)


### Name: getCoordinates-methods
### Title: Accessors for the 'points3D' and 'ends' slots of a Knot object.
### Aliases: getCoordinates-methods getCoordinates,Knot-method
###   getCoordinates [-methods [ [,Knot-method getEnds-methods
###   getEnds,Knot-method getEnds
### Keywords: methods

### ** Examples

knot <- makeExampleKnot(k = TRUE)
knot <- newKnot(knot)

getCoordinates(knot)
getEnds(knot)



