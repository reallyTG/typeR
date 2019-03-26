library(iFad)


### Name: gibbs_sampling
### Title: Gibbs sampling for the inference of the inference of parameters
###   in the sparse factor analysis model
### Aliases: gibbs_sampling

### ** Examples


library(Rlab)
library(MASS)
library(coda)
library(ROCR)

data(matrixY1)
data(matrixY2)
data(matrixL1)
data(matrixL2)

gibbs_sampling(matrixY1, matrixY2, matrixL1, matrixL2, 
eta0=c(0.2,0.2), eta1=c(0.2,0.2), alpha_tau = 1, 
beta_tau = 0.01, tau_sig = 1, max_iter = 5, thin = 1, 
file_name="Demo_Gibbs_result.RData")
      



