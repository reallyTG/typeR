library(pim)


### Name: is.complete
### Title: Check whether a pim environment is complete
### Aliases: is.complete

### ** Examples

# the constructor returns an empty environment without poset 
is.complete(new.pim.env())

# Constructing a pim environment with a poset
data("FEVData")
FEVenv <- new.pim.env(FEVData, compare="unique")
is.complete(FEVenv)




