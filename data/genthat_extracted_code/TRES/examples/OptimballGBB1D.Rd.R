library(TRES)


### Name: OptimballGBB1D
### Title: Estimate the envelope subspace (Feasi 1D)
### Aliases: OptimballGBB1D

### ** Examples

##simulate two matrices M and U with an envelope structure#
data <- MenvU_sim(n=200, p=20, u=5, Omega=NULL, Omega0=NULL, Phi=NULL)
Mhat <- data$Mhat
Uhat <- data$Uhat
G <- data$Gamma

Ghat_1D <- OptimballGBB1D(Mhat, Uhat, u=5)
subspace(Ghat_1D, G)



