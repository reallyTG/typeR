library(motmot.2.0)


### Name: as.rateMatrix
### Title: Conversion among data and phylogeny objects
### Aliases: as.rateMatrix

### ** Examples

## Read in phylogeny and data from Thomas et al. (2009)
data(anolis.tree)
data(anolis.data)

## Convert data to class rateMatrix
anolis.rateMatrix <- as.rateMatrix(phy=anolis.tree, x="geo_ecomorph", data=anolis.data)



