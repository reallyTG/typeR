library(insect)


### Name: prune_taxonomy
### Title: Prune taxonomy database.
### Aliases: prune_taxonomy

### ** Examples

## remove Odontoceti suborder from cetacean taxonomy database
data(whale_taxonomy)
prune_taxonomy(whale_taxonomy, taxIDs = 9722, keep = FALSE)



