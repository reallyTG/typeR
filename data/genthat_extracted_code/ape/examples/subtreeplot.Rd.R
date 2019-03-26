library(ape)


### Name: subtreeplot
### Title: Zoom on a Portion of a Phylogeny by Successive Clicks
### Aliases: subtreeplot
### Keywords: hplot

### ** Examples

## Not run: 
##D #example 1: simple
##D tree1 <- rtree(50)
##D tree2 <- subtreeplot(tree1, wait = TRUE) # on exit, tree2 will be a subtree of tree1
##D 
##D #example 2: more than one zoom
##D tree1 <- rtree(60)
##D tree2 <- subtreeplot(subtreeplot(subtreeplot(tree1))) # allow three succssive zooms
## End(Not run)



