library(taxa)


### Name: leaves
### Title: Get leaf taxa
### Aliases: leaves

### ** Examples

# Return indexes of leaf taxa
leaves(ex_taxmap)

# Return indexes for a subset of taxa
leaves(ex_taxmap, subset = 2:17)
leaves(ex_taxmap, subset = taxon_names == "Plantae")

# Return something besides taxon indexes
leaves(ex_taxmap, value = "taxon_names")
leaves(ex_taxmap, subset = taxon_ranks == "genus", value = "taxon_names")

# Return a vector of all unique values
leaves(ex_taxmap, value = "taxon_names", simplify = TRUE)

# Only return leaves for their direct supertaxa
leaves(ex_taxmap, value = "taxon_names", recursive = FALSE)




