library(rdiversity)


### Name: hs_parameters
### Title: Historical species parameters
### Aliases: hs_parameters

### ** Examples

tree <- ape::rtree(n = 5)
tree$tip.label <- paste0("sp", seq_along(tree$tip.label))
hs_parameters(tree)




