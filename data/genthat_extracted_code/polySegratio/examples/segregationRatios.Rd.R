library(polySegratio)


### Name: segregationRatios
### Title: Compute observed segregation proportions for dominant markers in
###   autopolyploids
### Aliases: segregationRatios
### Keywords: manip

### ** Examples


## simulate small autotetraplid data set
a1 <- sim.autoMarkers(4,c(0.8,0.2),n.markers=20,n.individuals=10)
print(a1)

print(segregationRatios(a1$markers))




