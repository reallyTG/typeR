library(hillR)


### Name: hill_phylo_parti_pairwise
### Title: Pairwise phylogenetic diversity through Hill numbers
### Aliases: hill_phylo_parti_pairwise

### ** Examples

## Not run: 
##D comm = dummy = FD::dummy$abun
##D tree = ape::rtree(n = ncol(comm), tip.label = paste0('sp', 1:8))
##D hill_phylo_parti_pairwise(comm, tree, q = 0, show.warning = FALSE)
##D hill_phylo_parti_pairwise(comm, tree, q = 0.999, show.warning = FALSE)
##D hill_phylo_parti_pairwise(comm, tree, q = 1, show.warning = FALSE)
##D hill_phylo_parti_pairwise(comm, tree, q = 2, show.warning = FALSE)
## End(Not run)



