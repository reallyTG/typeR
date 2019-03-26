library(hillR)


### Name: hill_taxa
### Title: Taxonomic diversity through Hill Numbers
### Aliases: hill_taxa

### ** Examples

dummy = FD::dummy
hill_taxa(comm = dummy$abun, q = 0)
# same as: vegan::specnumber(dummy$abun)
hill_taxa(comm = dummy$abun, q = 1)
# same as: exp(vegan::diversity(x = dummy$abun, index = 'shannon'))
hill_taxa(comm = dummy$abun, q = 2)
# same as: vegan::diversity(x = dummy$abun, index = 'invsimpson')
hill_taxa(comm = dummy$abun, q = 0.999)




