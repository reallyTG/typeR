library(motmot.2.0)


### Name: as.rateData
### Title: Conversion among data and phylogeny objects
### Aliases: as.rateData

### ** Examples

## Read in phylogeny and data from Thomas et al. (2009)
data(anolis.tree)
data(anolis.data)

## Convert data to class rateData with a rateMatrix object as input
anolis.rateMatrix <- as.rateMatrix(phy=anolis.tree, x="geo_ecomorph", data=anolis.data)

anolis.rateData <- as.rateData(y="Female_SVL", x="geo_ecomorph", 
rateMatrix = anolis.rateMatrix, phy=NULL, data=anolis.data, log.y=TRUE)  

## Convert data to class rateData with a phylo object as input 
anolis.rateData <- as.rateData(y="Female_SVL", x="geo_ecomorph", 
rateMatrix = NULL, phy=anolis.tree, data=anolis.data, log.y=TRUE)



