library(insect)


### Name: get_lineage
### Title: Get full lineage details from a taxonomic ID number.
### Aliases: get_lineage

### ** Examples

data(whales)
data(whale_taxonomy)
taxIDs <- as.integer(gsub(".+\\|", "", names(whales)[1:2]))
get_lineage(taxIDs, db = whale_taxonomy)



