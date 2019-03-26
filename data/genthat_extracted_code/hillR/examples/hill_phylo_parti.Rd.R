library(hillR)


### Name: hill_phylo_parti
### Title: Phylogenetic diversity of multiple sites
### Aliases: hill_phylo_parti

### ** Examples

comm = dummy = FD::dummy$abun
tree = ape::rtree(n = ncol(comm), tip.label = paste0('sp', 1:8))
hill_phylo_parti(comm, tree, q = 0)
hill_phylo_parti(comm, tree, q = 0.999)
hill_phylo_parti(comm, tree, q = 1)
hill_phylo_parti(comm, tree, q = 2)




