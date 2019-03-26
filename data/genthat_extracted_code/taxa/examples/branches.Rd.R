library(taxa)


### Name: branches
### Title: Get "branch" taxa
### Aliases: branches

### ** Examples

# Return indexes of branch taxa
branches(ex_taxmap)

# Return indexes for a subset of taxa
branches(ex_taxmap, subset = 2:17)
branches(ex_taxmap, subset = n_obs > 1)

# Return something besides taxon indexes
branches(ex_taxmap, value = "taxon_names")




