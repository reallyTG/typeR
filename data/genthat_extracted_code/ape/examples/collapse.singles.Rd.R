library(ape)


### Name: collapse.singles
### Title: Collapse Single Nodes
### Aliases: collapse.singles has.singles
### Keywords: manip

### ** Examples

## a tree with 3 tips and 3 nodes:
e <- c(4L, 6L, 6L, 5L, 5L, 6L, 1L, 5L, 3L, 2L)
dim(e) <- c(5, 2)
tr <- structure(list(edge = e, tip.label = LETTERS[1:3], Nnode = 3L),
                class = "phylo")
tr
has.singles(tr)
## the following shows that node #4 (ie, the root) is a singleton
## and node #6 is the first bifurcating node
tr$edge
## A bifurcating tree has less nodes than it has tips:
## the following used to fail with ape 4.1 or lower:
plot(tr)
collapse.singles(tr) # only 2 nodes
## give branch lengths to use the 'root.edge' option:
tr$edge.length <- runif(5)
str(collapse.singles(tr, TRUE)) # has a 'root.edge'



