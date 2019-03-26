library(assertable)


### Name: assert_ids
### Title: Assert that a data.frame contains all unique combinations of
###   specified ID variables, and doesn't contain duplicates within
###   combinations
### Aliases: assert_ids

### ** Examples

plants <- as.character(unique(CO2$Plant))
concs <- unique(CO2$conc)
ids <- list(Plant=plants,conc=concs)
assert_ids(CO2, ids)



