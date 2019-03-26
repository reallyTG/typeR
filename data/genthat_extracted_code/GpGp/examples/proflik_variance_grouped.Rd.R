library(GpGp)


### Name: proflik_variance_grouped
### Title: Grouped Version of Profile Likelihood (profiling out variance
###   only)
### Aliases: proflik_variance_grouped

### ** Examples

n1 <- 50
n2 <- 50             # size of grid of locations
locs <- as.matrix( expand.grid( (1:n1)/n1, (1:n2)/n2 ) )
n <- nrow(locs)
covparms = c(3,0.1,1,0)    # variance, range, smoothness, nugget
X = as.matrix( rep(1,n) )  # design matrix

# simulated response
y <- 2*X[,1] + fast_Gp_sim(covparms, "matern_isotropic", locs, m = 30)

ord <- order_maxmin(locs)         # ordering of locations
yord <- y[ord]                    # reordered response
Xord <- as.matrix( X[ord,] )      # reordered design matrix
locsord <- locs[ord,]             # reordered locations
NNarray <- find_ordered_nn(locsord, m = 30)     # nearest neighbor indices
NNlist <- group_obs(NNarray)

# loglikelihood at true values of parameters
vecchia_loglik_grouped( covparms, "matern_isotropic", 
    yord - 2*Xord[,1], locsord, NNlist )
# profile out mean only (likelihood larger than vecchia_loglik)
proflik_mean_grouped( covparms[1:4], "matern_isotropic", 
    yord, Xord, locsord, NNlist, return_parms = FALSE)
# profile out variance (likelihood larger than vecchia_loglik)
proflik_variance_grouped( covparms[2:4], "matern_isotropic", 
    yord - 2*Xord[,1], locsord, NNlist, return_parms = FALSE)
# profile out mean and variance (likelihood largest)
proflik_mean_variance_grouped( covparms[2:4], "matern_isotropic", 
    yord, Xord, locsord, NNlist, return_parms = FALSE)
# get all parameter values 
proflik_mean_variance_grouped( covparms[2:4], "matern_isotropic", 
    yord, Xord, locsord, NNlist, return_parms = TRUE)





