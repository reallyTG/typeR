library(taxa)


### Name: arrange_taxa
### Title: Sort the edge list of 'taxmap()' objects
### Aliases: arrange_taxa

### ** Examples

# Sort taxa in ascending order
arrange_taxa(ex_taxmap, taxon_names)

# Sort taxa in decending order
arrange_taxa(ex_taxmap, desc(taxon_names))

# Sort using an expression. List genera first.
arrange_taxa(ex_taxmap, taxon_ranks != "genus")




