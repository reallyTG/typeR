library(GPArotation)


### Name: eiv
### Title: Errors-in-Variables Rotation
### Aliases: eiv
### Keywords: multivariate

### ** Examples

  data("WansbeekMeijer", package="GPArotation")
  fa.unrotated  <- factanal(factors = 2, covmat=NetherlandsTV, rotation="none")

  fa.eiv <- eiv(fa.unrotated$loadings)
 
  fa.eiv2 <- factanal(factors = 2, covmat=NetherlandsTV, rotation="eiv")
  
  cbind(loadings(fa.unrotated), loadings(fa.eiv), loadings(fa.eiv2))

  fa.eiv3 <- eiv(fa.unrotated$loadings, identity=6:7)
  cbind(loadings(fa.unrotated), loadings(fa.eiv), loadings(fa.eiv3))

  


