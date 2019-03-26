library(pegas)


### Name: plotNetMDS
### Title: Plot Networks With MDS Layout
### Aliases: plotNetMDS
### Keywords: hplot

### ** Examples

data(woodmouse)
d <- dist.dna(woodmouse, "n")
net <- rmst(d)
plotNetMDS(net, d)



