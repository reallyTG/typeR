library(taxa)


### Name: obs
### Title: Get data indexes associated with taxa
### Aliases: obs

### ** Examples

# Get indexes of rows corresponding to each taxon
obs(ex_taxmap, "info")

# Get only a subset of taxon indexes
obs(ex_taxmap, "info", subset = 1:2)

# Get only a subset of taxon IDs
obs(ex_taxmap, "info", subset = c("b", "c"))

# Get only a subset of taxa using logical tests
obs(ex_taxmap, "info", subset = taxon_ranks == "genus")

# Only return indexes of rows assinged to each taxon explicitly
obs(ex_taxmap, "info", recursive = FALSE)

# Lump all row indexes in a single vector
obs(ex_taxmap, "info", simplify = TRUE)

# Return values from a dataset instead of indexes
obs(ex_taxmap, "info", value = "name")




