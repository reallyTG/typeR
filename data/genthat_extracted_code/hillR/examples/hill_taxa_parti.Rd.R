library(hillR)


### Name: hill_taxa_parti
### Title: Decompostion of Taxonomic diversity through Hill Numbers
### Aliases: hill_taxa_parti

### ** Examples

dummy = FD::dummy
hill_taxa_parti(comm = dummy$abun, q = 0)
hill_taxa_parti(comm = dummy$abun, q = 1)
hill_taxa_parti(comm = dummy$abun, q = 0.9999999)
hill_taxa_parti(comm = dummy$abun, q = 0.9999999, rel_then_pool = FALSE)
hill_taxa_parti(comm = dummy$abun, q = 1, rel_then_pool = FALSE)
hill_taxa_parti(comm = dummy$abun, q = 2)
hill_taxa_parti(comm = dummy$abun, q = 3)




