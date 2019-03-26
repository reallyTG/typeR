library(AMModels)


### Name: simCovariate
### Title: Simulate A Dataframe Of Uncorrelated Covariate(s)
### Aliases: simCovariate
### Keywords: datagen, distribution

### ** Examples

# We can specify the distribution using a function, function name, 
# or distribution name. Partial matching is performed. The examples 
# below generate data for a single covariate; random seeds are not 
# provided.

# All four examples provide same results and generate 10 random numbers 
# from a uniform distribution.  In some examples the results are rounded; 
# in other examples add.yr is set to TRUE to add a covariate called yr (year); 
# in other examples a random seed is provided to ensure reproducibility.

simCovariate(u1 =list(dist= runif), n=10, add.yr=FALSE)
simCovariate(u2=list(dist = 'runif', round=2), n = 10, add.yr=TRUE)
simCovariate(u3=list(dist ='uniform', seed=302), n=10, add.yr=TRUE)
simCovariate(u4 = list(dist ='u', seed=302, round=3, min=0, max=10), n=10, add.yr=TRUE)

# If multiple covariates are to be simulated, create a list of covariates 
# and then pass this covariate list as the argument, cov.list.  Here, create 
# a dataframe with seven covariates from five distributions, and 
# add a covariate called yr.  
cov.list <- list(
    unif1 = list(dist = 'runif', min=0, max=10, seed=334, round=0),
    unif2 = list(dist = 'runif', min=0, max=10, seed=668, round=0),
    norm1=list(dist = 'normal', mean = 10,sd = 2, seed=10, round=1),
    norm2=list(dist = 'normal',  mean = 50, sd = 10, seed=15, round=2),
    beta1=list(dist = rbeta, shape1=2, shape2=1, seed=1002),
    binom1=list(dist = 'bin', size=20, prob=0.5, seed=561),
    bern1=list(dist='bernoulli', size = 1, prob = 0.5, seed = 6)
)

simCovariate(cov.list, n = 10, add.yr = TRUE)



