library(taxa)


### Name: subtaxa_apply
### Title: Apply function to subtaxa of each taxon
### Aliases: subtaxa_apply

### ** Examples

# Count number of subtaxa in each taxon
subtaxa_apply(ex_taxmap, length)

# Paste all the subtaxon names for each taxon
subtaxa_apply(ex_taxmap, value = "taxon_names",
              recursive = FALSE, paste0, collapse = ", ")



