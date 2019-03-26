library(rdiversity)


### Name: metacommunity
### Title: Coerce to 'metacommunity'
### Aliases: metacommunity metacommunity,data.frame,missing-method
###   metacommunity,data.frame-method metacommunity,numeric,missing-method
###   metacommunity,numeric-method metacommunity,matrix,missing-method
###   metacommunity,matrix-method metacommunity,data.frame,matrix-method
###   metacommunity,data.frame-method,matrix-method
###   metacommunity,numeric,matrix-method
###   metacommunity,numeric-method,matrix-method
###   metacommunity,matrix,matrix-method metacommunity,matrix-method
###   metacommunity,missing,phylo-method metacommunity,phylo-method
###   metacommunity,numeric,phylo-method
###   metacommunity,numeric-method,phylo-method
###   metacommunity,data.frame,phylo-method
###   metacommunity,data.frame-method,phylo-method
###   metacommunity,matrix,phylo-method
###   metacommunity,matrix-method,phylo-method is.metacommunity

### ** Examples

tree <- ape::rtree(n = 5)
tree$tip.label <- paste0("sp", seq_along(tree$tip.label))
partition <- cbind(a = c(1,1,1,0,0), b = c(0,1,0,1,1))
row.names(partition) <- tree$tip.label
partition <- partition / sum(partition)

a <- metacommunity(partition, tree)
b <- metacommunity(partition)




