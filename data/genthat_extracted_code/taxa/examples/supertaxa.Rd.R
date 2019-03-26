library(taxa)


### Name: supertaxa
### Title: Get all supertaxa of a taxon
### Aliases: supertaxa

### ** Examples

# return the indexes for supertaxa for each taxon
supertaxa(ex_taxmap)

# Only return data for some taxa using taxon indexes
supertaxa(ex_taxmap, subset = 1:3)

# Only return data for some taxa using taxon ids
supertaxa(ex_taxmap, subset = c("d", "e"))

# Only return data for some taxa using logical tests
supertaxa(ex_taxmap, subset = taxon_ranks == "species")

# Only return supertaxa one level above
supertaxa(ex_taxmap, recursive = FALSE)

# Only return supertaxa some number of ranks above
supertaxa(ex_taxmap, recursive = 2)

# Return something besides taxon indexes
supertaxa(ex_taxmap, value = "taxon_names")



