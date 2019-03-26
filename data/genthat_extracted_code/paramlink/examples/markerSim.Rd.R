library(paramlink)


### Name: markerSim
### Title: Marker simulation
### Aliases: markerSim

### ** Examples


x = nuclearPed(2)
partial = marker(x, 3, 1, alleles=1:3)
markerSim(x, N=1, alleles=1:3)
markerSim(x, N=1, partialmarker=partial)
markerSim(x, N=1, partialmarker=partial)
markerSim(x, N=1, available=4, partialmarker=partial)




