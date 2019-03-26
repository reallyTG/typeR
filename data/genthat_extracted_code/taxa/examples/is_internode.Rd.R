library(taxa)


### Name: is_internode
### Title: Test if taxa are "internodes"
### Aliases: is_internode

### ** Examples

# Test for which taxon IDs correspond to internodes
is_internode(ex_taxmap)

# Filter out internodes
filter_taxa(ex_taxmap, ! is_internode)




