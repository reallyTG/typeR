library(pdist)


### Name: pdist
### Title: Partitioned Distances
### Aliases: pdist

### ** Examples

x = matrix(rnorm(100),10,10)
  x.pdist = pdist(x, indices.A = 1:3, indices.B = 8:10)
  message("Find the distance between observation 1 and 10 of x")
  x.pdist[1,3]
  message("Converting a pdist object into a traditional distance matrix")
  as.matrix(x.pdist)



