library(taxa)


### Name: supertaxa_apply
### Title: Apply function to supertaxa of each taxon
### Aliases: supertaxa_apply

### ** Examples

# Get number of supertaxa that each taxon is contained in
supertaxa_apply(ex_taxmap, length)

# Get classifications for each taxon
# Note; this can be done with `classifications()` easier
supertaxa_apply(ex_taxmap, paste, collapse = ";", include_input = TRUE,
                value = "taxon_names")




