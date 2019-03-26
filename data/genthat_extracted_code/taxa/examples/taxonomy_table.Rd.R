library(taxa)


### Name: taxonomy_table
### Title: Convert taxonomy info to a table
### Aliases: taxonomy_table

### ** Examples

# Make a table of taxon names
taxonomy_table(ex_taxmap)

# Use a differnt value
taxonomy_table(ex_taxmap, value = "taxon_ids")

# Return a subset of taxa
taxonomy_table(ex_taxmap, subset = taxon_ranks == "genus")

# Use arbitrary ranks names based on depth
taxonomy_table(ex_taxmap, use_ranks = FALSE)




