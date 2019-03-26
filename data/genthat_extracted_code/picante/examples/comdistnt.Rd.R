library(picante)


### Name: comdistnt
### Title: Calculates inter-community mean nearest taxon distance
### Aliases: comdistnt comdistnn
### Keywords: univar

### ** Examples

data(phylocom)
comdistnt(phylocom$sample, cophenetic(phylocom$phylo), abundance.weighted=FALSE)


