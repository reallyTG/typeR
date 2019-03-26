library(tsfa)


### Name: estFAmodel
### Title: Estimate a Factor Model
### Aliases: estFAmodel
### Keywords: ts

### ** Examples

  data("WansbeekMeijer", package="GPArotation")
  fa.unrotated  <-  estFAmodel(NetherlandsTV, 2, n.obs=2150, rotation="none" )
  fa.varimax <- estFAmodel(NetherlandsTV, 2, n.obs=2150, rotation="Varimax" )
  fa.eiv     <- estFAmodel(NetherlandsTV, 2, n.obs=2150, rotation="eiv" )
  fa.oblimin <- estFAmodel(NetherlandsTV, 2, n.obs=2150, rotation="oblimin" )
  
  cbind(loadings(fa.unrotated), loadings(fa.varimax), loadings(fa.oblimin), loadings(fa.eiv))
  


