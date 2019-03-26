library(ERP)


### Name: ifa
### Title: Inverse of a matrix based on its factor decomposition.
### Aliases: ifa

### ** Examples

data(impulsivity)
erpdta = as.matrix(impulsivity[,5:505])   # erpdta contains the whole set of ERP curves     
fa = emfa(erpdta,nbf=20)          # 20-factor modelling of the ERP curves in erpdta
Sfa = diag(fa$Psi)+tcrossprod(fa$B) # Factorial estimation of the variance 
iSfa = ifa(fa$Psi,fa$B)$iS        # Matrix inversion    
max(abs(crossprod(Sfa,iSfa)-diag(ncol(erpdta)))) # Checks that Sfa x iSfa = diag(ncol(erpdta))



