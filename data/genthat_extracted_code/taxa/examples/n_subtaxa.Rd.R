library(taxa)


### Name: n_subtaxa
### Title: Get number of subtaxa
### Aliases: n_subtaxa

### ** Examples

# Count number of subtaxa within each taxon
n_subtaxa(ex_taxmap)

# Filter taxa based on number of subtaxa
#  (this command removed all leaves or "tips" of the tree)
filter_taxa(ex_taxmap, n_subtaxa > 0)




