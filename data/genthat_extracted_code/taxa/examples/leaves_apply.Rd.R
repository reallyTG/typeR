library(taxa)


### Name: leaves_apply
### Title: Apply function to leaves of each taxon
### Aliases: leaves_apply

### ** Examples

# Count number of leaves under each taxon or its subtaxa
leaves_apply(ex_taxmap, length)

# Count number of leaves under each taxon
leaves_apply(ex_taxmap, length, recursive = FALSE)

# Converting output of leaves to upper case
leaves_apply(ex_taxmap, value = "taxon_names", toupper)

# Passing arguments to the function
leaves_apply(ex_taxmap, value = "taxon_names", paste0, collapse = ", ")




