library(hillR)


### Name: hill_phylo
### Title: Phylogenetic diversity through Hill Numbers
### Aliases: hill_phylo

### ** Examples

comm = dummy = FD::dummy$abun
tree = ape::rtree(n = ncol(comm), tip.label = paste0('sp', 1:8))
hill_phylo(comm, tree, q = 0)
hill_phylo(comm, tree, q = 0.999)
hill_phylo(comm, tree, q = 1)
hill_phylo(comm, tree, q = 2)




