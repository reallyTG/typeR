library(data.tree)


### Name: as.Node.phylo
### Title: Convert a 'phylo' object from the ape package to a 'Node'
### Aliases: as.Node.phylo

### ** Examples

#which bird familes have the max height?
library(ape)
data(bird.families)
bf <- as.Node(bird.families)
height <- bf$height
t <- Traverse(bf, filterFun = function(x) x$level == 25)
Get(t, "name")




