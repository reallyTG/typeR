library(TRES)


### Name: manifoldFG
### Title: Full Grassmann manifold optimization algorithm (ManifoldOptim)
### Aliases: manifoldFG

### ** Examples

##simulate two matrices M and U with an envelope structure#
data <- MenvU_sim(n=200, p=20, u=5)
Mhat <- data$Mhat
Uhat <- data$Uhat
G <- data$Gamma

Ghat_1D <- manifold1D(Mhat, Uhat, u=5)
subspace(Ghat_1D, G)

Ghat_FG <- manifoldFG(Mhat, Uhat, u=5, Ghat_1D)
subspace(Ghat_FG, G)



