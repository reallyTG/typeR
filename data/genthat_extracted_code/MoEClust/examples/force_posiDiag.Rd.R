library(MoEClust)


### Name: force_posiDiag
### Title: Force diagonal elements of a triangular matrix to be positive
### Aliases: force_posiDiag
### Keywords: utility

### ** Examples

data(ais)
res <- MoE_clust(ais[,3:7], G=3, modelNames="EEE")
sig <- res$parameters$variance
a   <- force_posiDiag(sig$cholSigma)
b   <- chol(sig$Sigma)
round(sum(a - b), 10) == 0          #TRUE
sum(crossprod(a) != sig$Sigma) == 0 #TRUE
sum(crossprod(b) != sig$Sigma) == 0 #TRUE



