library(MBSGS)


### Name: MBGLSS
### Title: Multivariate Bayesian Group Lasso with Spike and Slab prior
### Aliases: MBGLSS
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
##D model <- MBGLSS(Y,X,niter,burnin,gsize,num_update = 100,
##D niter.update = 100)
##D model$pos_median[,1]!=0
## End(Not run)


