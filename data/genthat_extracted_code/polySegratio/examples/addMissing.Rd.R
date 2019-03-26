library(polySegratio)


### Name: addMissing
### Title: Adds missing data to objects of class autoMarker or autoCross
### Aliases: addMissing
### Keywords: datagen manip

### ** Examples

## simulate autopolyploid markers
p1 <- sim.autoCross(4, dose.proportion=c(0.7,0.3), n.markers=20, n.indiv=10)
p2 <- sim.autoCross(4, dose.proportion=list(p01=c(0.7,0.3),p10=c(0.7,0.3),p11=c(
0.6,0.2,0.2)))

## add missings
addMissing(p2, 0.1)



