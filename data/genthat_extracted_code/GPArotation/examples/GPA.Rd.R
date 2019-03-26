library(GPArotation)


### Name: GPA
### Title: Rotation Optimization
### Aliases: GPForth GPFoblq
### Keywords: multivariate

### ** Examples

  data("Harman", package="GPArotation")
  qHarman  <- GPForth(Harman8, Tmat=diag(2), method="quartimax")

  data("WansbeekMeijer", package="GPArotation")
  fa.unrotated  <- factanal(factors = 2, covmat=NetherlandsTV, 
              normalize=TRUE, rotation="none")

  GPForth(loadings(fa.unrotated), method="varimax", normalize=TRUE)$loadings

  TV <- GPFoblq(loadings(fa.unrotated), method="oblimin", normalize=TRUE)

  print(TV)
  print(TV, Table=TRUE)
  summary(TV)
  


