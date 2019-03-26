library(taxa)


### Name: classifications
### Title: Get classifications of taxa
### Aliases: classifications

### ** Examples

# Defualt settings returns taxon names separated by ;
classifications(ex_taxmap)

# Other values can be returned besides taxon names
classifications(ex_taxmap, value = "taxon_ids")

# The separator can also be changed
classifications(ex_taxmap, value = "taxon_ranks", sep = "||")




