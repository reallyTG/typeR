library(taxa)


### Name: replace_taxon_ids
### Title: Replace taxon ids
### Aliases: replace_taxon_ids

### ** Examples

# Replace taxon IDs with numbers
replace_taxon_ids(ex_taxmap, seq_len(length(ex_taxmap$taxa)))

# Make taxon IDs capital letters
replace_taxon_ids(ex_taxmap, toupper(taxon_ids(ex_taxmap)))




