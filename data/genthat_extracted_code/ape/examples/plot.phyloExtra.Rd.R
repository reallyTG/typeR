library(ape)


### Name: plot.phylo.extra
### Title: Extra Fuctions to Plot and Annotate Phylogenies
### Aliases: plot.phylo.extra plotBreakLongEdges drawSupportOnEdges
### Keywords: hplot

### ** Examples

tr <- rtree(10)
tr$edge.length[c(1, 18)] <- 100
op <- par(mfcol = 1:2)
plot(tr); axisPhylo()
plotBreakLongEdges(tr, 2); axisPhylo()

## from ?boot.phylo:
f <- function(x) nj(dist.dna(x))
data(woodmouse)
tw <- f(woodmouse) # NJ tree with K80 distance
set.seed(1)
## bootstrap with 100 replications:
(bp <- boot.phylo(tw, woodmouse, f, quiet = TRUE))
## the first value relates to the root node and is always 100
## it is ignored below:
plot(tw, "u")
drawSupportOnEdges(bp)
## more readable but the tree is really unrooted:
plot(tw)
drawSupportOnEdges(bp)
par(op)



