library(GPArotation)


### Name: echelon
### Title: Echelon Rotation
### Aliases: echelon
### Keywords: multivariate

### ** Examples

  data("WansbeekMeijer", package="GPArotation")
  fa.unrotated  <- factanal(factors = 2, covmat=NetherlandsTV, rotation="none")

  fa.ech <- echelon(fa.unrotated$loadings)
 
  fa.ech2 <- factanal(factors = 2, covmat=NetherlandsTV, rotation="echelon")
  
  cbind(loadings(fa.unrotated), loadings(fa.ech), loadings(fa.ech2))

  fa.ech3 <- echelon(fa.unrotated$loadings, reference=6:7)
  cbind(loadings(fa.unrotated), loadings(fa.ech), loadings(fa.ech3))
  


