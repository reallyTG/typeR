library(biclust)


### Name: BCCC
### Title: The CC Bicluster algorithm
### Aliases: BCCC CC BCCC-class biclust,matrix,BCCC-method
### Keywords: cluster classif

### ** Examples

test <- matrix(rbinom(400, 50, 0.4), 20, 20)
res <- biclust(test, method=BCCC(), delta=1.5,  alpha=1, number=10)
res



