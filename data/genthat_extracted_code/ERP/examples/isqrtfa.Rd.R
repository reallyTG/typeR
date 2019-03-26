library(ERP)


### Name: isqrtfa
### Title: Inverse square-root of a matrix based on its factor
###   decomposition.
### Aliases: isqrtfa

### ** Examples

data(impulsivity)
erpdta = as.matrix(impulsivity[,5:505])   # erpdta contains the whole set of ERP curves     
fa = emfa(erpdta,nbf=20)          # 20-factor modelling of the ERP curves in erpdta
Sfa = diag(fa$Psi)+tcrossprod(fa$B) # Factorial estimation of the variance 
iSfa = ifa(fa$Psi,fa$B)$iS        # Matrix inversion    
isqrtSfa = isqrtfa(fa$Psi,fa$B)   # Inverse square-root of Sfa
max(abs(tcrossprod(isqrtSfa)-iSfa)) # Checks that isqrtSfa x t(isqrtSfa) = iSfa



