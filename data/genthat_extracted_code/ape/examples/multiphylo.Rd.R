library(ape)


### Name: multiphylo
### Title: Manipulating Lists of Trees
### Aliases: multiphylo [.multiPhylo [[.multiPhylo $.multiPhylo
###   [<-.multiPhylo [[<-.multiPhylo $<-.multiPhylo
### Keywords: manip

### ** Examples

x <- rmtree(10, 20)
names(x) <- paste("tree", 1:10, sep = "")
x[1:5]
x[1] # subsetting
x[[1]] # extraction
x$tree1 # same than above
x[[1]] <- rtree(20)

y <- .compressTipLabel(x)
## up to here 'x' and 'y' have exactly the same information
## but 'y' has a unique vector of tip labels for all the trees
x[[1]] <- rtree(10) # no error
try(y[[1]] <- rtree(10)) # error

try(x[1] <- rtree(20)) # error
## use instead one of the two:
x[1] <- list(rtree(20))
x[1] <- c(rtree(20))

x[1:5] <- rmtree(5, 20) # replacement
x[11:20] <- rmtree(10, 20) # elongation
x # 20 trees



