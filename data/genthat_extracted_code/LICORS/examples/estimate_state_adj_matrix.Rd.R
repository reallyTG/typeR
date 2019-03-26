library(LICORS)


### Name: estimate_state_adj_matrix
### Title: Estimate adjacency matrix for equivalent FLC distributions based
###   on states
### Aliases: estimate_state_adj_matrix
### Keywords: distribution manip multivariate nonparametric

### ** Examples

WW <- matrix(runif(10000), ncol = 10)
WW <- normalize(WW)
temp_flcs <- cbind(rnorm(nrow(WW)))
temp_pdfs.FLC <- estimate_LC_pdfs(temp_flcs, WW)
AA_ks <- estimate_state_adj_matrix(states = weight_matrix2states(WW), FLCs = temp_flcs, 
    distance = "KS")
AA_L1 <- estimate_state_adj_matrix(pdfs.FLC = temp_pdfs.FLC)

par(mfrow = c(1, 2), mar = c(1, 1, 2, 1))
image2(AA_ks, zlim = c(0, 1), legend = FALSE, main = "Kolmogorov-Smirnov")
image2(AA_L1, legend = FALSE, main = "L1 distance")



