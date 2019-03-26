library(GpGp)


### Name: vecchia_loglik_grouped
### Title: Grouped Vecchia's approximation to the Gaussian loglikelihood
### Aliases: vecchia_loglik_grouped

### ** Examples

n1 <- 40
n2 <- 40
n <- n1*n2
locs <- as.matrix( expand.grid( (1:n1)/n1, (1:n2)/n2 ) )
covparms <- c(2, 0.2, 0.75, 0)
y <- fast_Gp_sim(covparms, "matern_isotropic", locs, 50 ) 
ord <- order_maxmin(locs)
NNarray <- find_ordered_nn(locs,20)
NNlist <- group_obs(NNarray)
loglik <- vecchia_loglik_grouped( covparms, "matern_isotropic", y, locs, NNlist )



