library(SPECIES)


### Name: ChaoLee1992
### Title: Coverage-based estimators for species richness
### Aliases: ChaoLee1992

### ** Examples

library(SPECIES)

##load data from the package, 
## "butterfly" is the famous butterfly data by Fisher 1943.

data(butterfly)

##output estimates from all 4 methods using cutoff t=10
ChaoLee1992(butterfly,t=10,method="all")

##output estimates from ACE method using cutoff t=10
ChaoLee1992(butterfly,t=10,method="ACE")



