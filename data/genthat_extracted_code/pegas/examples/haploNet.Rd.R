library(pegas)


### Name: haploNet
### Title: Haplotype Networks
### Aliases: haploNet print.haploNet plot.haploNet as.network.haploNet
###   as.igraph.haploNet
### Keywords: models hplot

### ** Examples

## generate some artificial data from 'woodmouse':
data(woodmouse)
x <- woodmouse[sample(15, size = 110, replace = TRUE), ]
h <- haplotype(x)
(net <- haploNet(h))
plot(net)
## symbol sizes equal to haplotype sizes:
plot(net, size = attr(net, "freq"), fast = TRUE)
plot(net, size = attr(net, "freq"))
plot(net, size=attr(net, "freq"), scale.ratio = 2, cex = 0.8)



