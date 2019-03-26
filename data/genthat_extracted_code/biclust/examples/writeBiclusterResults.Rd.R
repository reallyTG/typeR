library(biclust)


### Name: writeBiclusterResults
### Title: writeBiclusterResults
### Aliases: writeBiclusterResults writeBiclusters
### Keywords: manip array

### ** Examples

  data(BicatYeast)
  res <- biclust(BicatYeast, method=BCCC(), delta=1.5,  alpha=1, number=10)
  writeBiclusterResults("results.txt", res,"CC with delta 1.5", dimnames(BicatYeast)[1][[1]],
    dimnames(BicatYeast)[2][[1]])
  


