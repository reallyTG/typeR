library(taxa)


### Name: is_leaf
### Title: Test if taxa are leaves
### Aliases: is_leaf

### ** Examples

# Test which taxon IDs correspond to leaves
is_leaf(ex_taxmap)

# Filter out leaves
filter_taxa(ex_taxmap, ! is_leaf)




