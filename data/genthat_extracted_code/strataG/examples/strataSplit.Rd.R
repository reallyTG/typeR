library(strataG)


### Name: strataSplit
### Title: Split Strata
### Aliases: strataSplit

### ** Examples

data(msats.g)

# Proportion of unique alleles in each stratum
msats.list <- strataSplit(msats.g)
sapply(msats.list, propUniqueAlleles)




