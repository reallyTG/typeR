library(biclust)


### Name: writeclust
### Title: Write a Bicluster as a Cluster Result
### Aliases: writeclust
### Keywords: hplot cluster

### ** Examples


  s2=matrix(rnorm(400),20,20)
  s2[12:16,12:16]=rnorm(25,3,0.3)
  set.seed(1)
  bics <- biclust(s2,BCPlaid(), back.fit = 2, shuffle = 3, fit.model = ~m + a + b,
  iter.startup = 5, iter.layer = 30,  verbose = TRUE)
  writeclust(bics)




