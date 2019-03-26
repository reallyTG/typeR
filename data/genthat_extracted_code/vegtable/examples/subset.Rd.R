library(vegtable)


### Name: subset
### Title: Subset functions for vegtable objects.
### Aliases: subset subset,vegtable-method
### Keywords: methods

### ** Examples

library(vegtable)
data(dune_veg)
summary(dune_veg)

## Select plots used as pastures
Pastures <- subset(dune_veg, Use == "Pasture", slot="header")
summary(Pastures)



