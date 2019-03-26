library(MBSGS)


### Name: MBSGSSS
### Title: Multivariate Bayesian Sparse Group Selection with Spike and Slab
###   priors
### Aliases: MBSGSSS
### Keywords: regression multivariate

### ** Examples

## Not run: 
##D ## Simulation of datasets X and Y with group variables
##D data1 = gen_data_Multi(nsample = 120, ntrain = 80)
##D data1 = Mnormalize(data1)
##D 
##D true_model <- data1$true_model
##D X <- data1$X
##D Y<- data1$Y
##D train_idx <- data1$train_idx
##D gsize <- data1$gsize
##D niter <- 2000
##D burnin <- 1000
##D 
##D model <- MBSGSSS(Y,X,niter=niter,burnin=burnin,group_size=gsize,
##D num_update = 50,niter.update = 50)
##D model$pos_median[,1]!=0
## End(Not run)


