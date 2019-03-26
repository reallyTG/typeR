library(taxa)


### Name: stems
### Title: Get stem taxa
### Aliases: stems

### ** Examples

# Return indexes of stem taxa
stems(ex_taxmap)

# Return indexes for a subset of taxa
stems(ex_taxmap, subset = 2:17)

# Return something besides taxon indexes
stems(ex_taxmap, value = "taxon_names")

# Return a vector instead of a list
stems(ex_taxmap, value = "taxon_names", simplify = TRUE)




