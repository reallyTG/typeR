library(pegas)


### Name: mst
### Title: Minimum Spanning Tree and Network
### Aliases: mst msn rmst
### Keywords: models

### ** Examples

data(woodmouse)
d <- dist.dna(woodmouse, "n")
(r <- mst(d))
plot(r)



