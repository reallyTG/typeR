library(psychotools)


### Name: PairClustering
### Title: Pair Clustering Data in Klauer (2006)
### Aliases: PairClustering
### Keywords: datasets

### ** Examples

data("PairClustering", package = "psychotools")
aggregate(cbind(E1, E2, E3, E4, F1, F2) ~ trial, PairClustering, sum)



