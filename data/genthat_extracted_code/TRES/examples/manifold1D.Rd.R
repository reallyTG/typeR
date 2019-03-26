library(TRES)


### Name: manifold1D
### Title: Estimate the envelope subspace (ManifoldOptim 1D)
### Aliases: manifold1D

### ** Examples

##simulate two matrices M and U with an envelope structure#
data <- MenvU_sim(n=200, p=20, u=5)
Mhat <- data$Mhat
Uhat <- data$Uhat
G <- data$Gamma

Ghat_1D <- manifold1D(Mhat, Uhat, u=5, params=NULL)
subspace(Ghat_1D, G)



