library(lfe)


### Name: makeDmatrix
### Title: Make sparse matrix of dummies from factor list
### Aliases: makeDmatrix

### ** Examples


  fl <- lapply(1:3, function(i) factor(sample(3,10,replace=TRUE)))
  fl
  makeDmatrix(fl, weights=seq(0.1,1,0.1))




