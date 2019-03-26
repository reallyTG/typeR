library(paramlink)


### Name: transferMarkerdata
### Title: Transfer marker data
### Aliases: transferMarkerdata

### ** Examples


x = list(singleton(id=5), nuclearPed(noffs=2))
x = markerSim(x, N=5, alleles=1:5, verbose=FALSE, available=4:5)
y = nuclearPed(noffs=3)
y = transferMarkerdata(x, y)
stopifnot(all.equal(x[[1]], branch(y,5)))
stopifnot(all.equal(x[[2]], subset(y,1:4)))




