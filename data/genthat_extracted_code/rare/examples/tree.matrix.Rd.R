library(rare)


### Name: tree.matrix
### Title: Generate matrix A encoding ancestor-descendant relationships in
###   an hclust tree
### Aliases: tree.matrix

### ** Examples

## Not run: 
##D # For a perfect binary tree of depth 2 below
##D #
##D #      3
##D #      /\
##D #    1    2
##D #   /\    /\
##D # -1 -2 -3 -4
##D #
##D # A can expressed as the following:
##D A_true <- cbind(diag(4),
##D                 as.matrix(c(1, 1, 0, 0)),
##D                 as.matrix(c(0, 0, 1, 1)),
##D                 as.matrix(c(1, 1, 1, 1)))
##D # Now use tree.matrix to generate A
##D tree0 <- list()
##D tree0$merge <- matrix(c(-1, -2, -3, -4, 1, 2),
##D                       ncol = 2, byrow = TRUE)
##D tree0$labels <- c("leaf1", "leaf2", "leaf3", "leaf4")
##D A <- tree.matrix(tree0)
##D all(A_true == as.matrix(A))
##D 
##D # Another example
##D hc <- hclust(dist(USArrests), "ave")
##D A <- tree.matrix(hc)
## End(Not run)




