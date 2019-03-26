library(taxlist)


### Name: match_names
### Title: Search Matchings between Character and taxlist Objects
### Aliases: match_names match_names,character,taxlist-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## Names to be compared
species <- c("Cperus papyrus", "Typha australis", "Luke skywalker")

## Retrieve taxon usage names
match_names(species, Easplist)

## Display accepted names in output
match_names(species, Easplist, show_concepts=TRUE)



