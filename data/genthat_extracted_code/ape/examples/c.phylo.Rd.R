library(ape)


### Name: c.phylo
### Title: Building Lists of Trees
### Aliases: c.phylo c.multiPhylo .compressTipLabel .uncompressTipLabel
### Keywords: manip

### ** Examples

x <- c(rtree(4), rtree(2))
x
y <- c(rtree(4), rtree(4))
z <- c(x, y)
z
print(z, TRUE)
try(.compressTipLabel(x)) # error
a <- .compressTipLabel(y)
.uncompressTipLabel(a) # back to y
## eventually compare str(a) and str(y)



