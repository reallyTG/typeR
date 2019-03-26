library(taxa)


### Name: taxon_ids
### Title: Get taxon IDs
### Aliases: taxon_ids

### ** Examples

# Return the taxon IDs for each taxon
taxon_ids(ex_taxmap)

# Filter using taxon IDs
filter_taxa(ex_taxmap, ! taxon_ids %in% c("c", "d"))




