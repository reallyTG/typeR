library(picante)


### Name: comdist
### Title: Calculates inter-community mean pairwise distance
### Aliases: comdist
### Keywords: univar

### ** Examples

data(phylocom)
comdist(phylocom$sample, cophenetic(phylocom$phylo), abundance.weighted=TRUE)


