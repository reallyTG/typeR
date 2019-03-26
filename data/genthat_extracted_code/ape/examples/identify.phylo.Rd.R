library(ape)


### Name: identify.phylo
### Title: Graphical Identification of Nodes and Tips
### Aliases: identify.phylo
### Keywords: aplot

### ** Examples

## Not run: 
##D tr <- rtree(20)
##D f <- function(col) {
##D     o <- identify(tr)
##D     nodelabels(node=o$nodes, pch = 19, col = col)
##D }
##D plot(tr)
##D f("red") # click close to a node
##D f("green")
## End(Not run)



