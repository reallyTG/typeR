library(taxa)


### Name: subtaxa
### Title: Get subtaxa
### Aliases: subtaxa

### ** Examples

# return the indexes for subtaxa for each taxon
subtaxa(ex_taxmap)

# Only return data for some taxa using taxon indexes
subtaxa(ex_taxmap, subset = 1:3)

# Only return data for some taxa using taxon ids
subtaxa(ex_taxmap, subset = c("d", "e"))

# Only return data for some taxa using logical tests
subtaxa(ex_taxmap, subset = taxon_ranks == "genus")

# Only return subtaxa one level below
subtaxa(ex_taxmap, recursive = FALSE)

# Only return subtaxa some number of ranks below
subtaxa(ex_taxmap, recursive = 2)

# Return something besides taxon indexes
subtaxa(ex_taxmap, value = "taxon_names")



