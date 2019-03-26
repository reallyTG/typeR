library(ape)


### Name: comparePhylo
### Title: Compare Two "phylo" Objects
### Aliases: comparePhylo print.comparePhylo
### Keywords: manip

### ** Examples

## two unrooted trees but force comparison as rooted:
a <- read.tree(text = "(a,b,(c,d));")
b <- read.tree(text = "(a,c,(b,d));")
comparePhylo(a, b, plot = TRUE, force.rooted = TRUE)
## two random unrooted trees:
c <- rtree(5, rooted = FALSE)
d <- rtree(5, rooted = FALSE)
comparePhylo(c, d, plot = TRUE)



