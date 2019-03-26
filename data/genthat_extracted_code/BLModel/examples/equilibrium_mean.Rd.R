library(BLModel)


### Name: equilibrium_mean
### Title: Solves the inverse optimization to mean-risk standard
###   optimization problem to find equilibrium returns. The function is
###   invoked by BL_post_distr and arguments are supplemented by
###   BL_post_distr.
### Aliases: equilibrium_mean

### ** Examples


# In normal usage all data are supplemented by function BL_post_distr.
library(mvtnorm)
k = 3 
num =100
dat <-  cbind(rmvnorm (n=num, mean = rep(0,k), sigma=diag(k)), matrix(1/num,num,1)) 
# a data sample with num rows and (k+1) columns for k assets;
w_m <- rep(1/k,k) # market portfolio.
RM = 0.05 # market expected return.
equilibrium_mean (dat, w_m, RM, risk = "CVAR", alpha = 0.95) 




