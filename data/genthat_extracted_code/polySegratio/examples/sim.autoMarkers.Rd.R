library(polySegratio)


### Name: sim.autoMarkers
### Title: Simulates dominant markers from an autopolyploid cross
### Aliases: sim.autoMarkers
### Keywords: manip

### ** Examples


## generate autopolyploid markers
a1 <- sim.autoMarkers(4,c(0.8,0.2),n.markers=20,n.individuals=10)
print(a1)

a2 <-
sim.autoMarkers(8,c(0.7,0.2,0.09,0.01),type.parents="homo",n.markers=20,n.individuals=10)
print(a2)




