library(taxa)


### Name: n_subtaxa_1
### Title: Get number of subtaxa
### Aliases: n_subtaxa_1

### ** Examples

# Count number of immediate subtaxa in each taxon
n_subtaxa_1(ex_taxmap)

# Filter taxa based on number of subtaxa
#  (this command removed all leaves or "tips" of the tree)
filter_taxa(ex_taxmap, n_subtaxa_1 > 0)




