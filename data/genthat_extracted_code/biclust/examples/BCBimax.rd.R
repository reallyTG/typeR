library(biclust)


### Name: BCBimax
### Title: The Bimax Bicluster algorithm
### Aliases: BCBimax Bimax BCBimax-class biclust,matrix,BCBimax-method
###   BCrepBimax repBimax BCrepBimax-class biclust,matrix,BCrepBimax-method
### Keywords: cluster classif

### ** Examples

 test <- matrix(rnorm(5000), 100, 50)
 test[11:20,11:20] <- rnorm(100, 3, 0.1)
 loma <- binarize(test,2)
 res <- biclust(x=loma, method=BCBimax(), minr=4, minc=4, number=10)
 res



