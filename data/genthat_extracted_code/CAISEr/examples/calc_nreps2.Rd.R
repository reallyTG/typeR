library(CAISEr)


### Name: calc_nreps2
### Title: Determine sample sizes for a pair of algorithms on a problem
###   instance
### Aliases: calc_nreps2

### ** Examples

# Uses dummy algorithms and a dummy instance to illustrate the
# use of calc_nreps2
algorithm1 <- list(FUN = "dummyalgo", alias = "algo1",
                   distribution.fun = "rnorm",
                   distribution.pars = list(mean = 10, sd = 1))
algorithm2 <- list(FUN = "dummyalgo", alias = "algo2",
                   distribution.fun = "rnorm",
                   distribution.pars = list(mean = 20, sd = 4))
instance <- list(FUN = "dummyinstance")

# Theoretical results for an SE = 0.5 on the simple difference:
# phi = 10; n1 = 20; n2 = 80
# (using the parametric approach)
my.reps  <- calc_nreps2(instance, algorithm1, algorithm2,
                        se.max = 0.5, dif = "simple", seed = 1234)
cat("n1j   =", my.reps$n1j, "\nn2j   =", my.reps$n2j,
    "\nphi_j =", my.reps$phi.est, "\nse    =", my.reps$se)

# Forcing equal sample sizes:
my.reps  <- calc_nreps2(instance, algorithm1, algorithm2,
                        se.max = 0.5, dif = "simple", seed = 1234,
                        force.balanced = TRUE)
cat("n1j   =", my.reps$n1j, "\nn2j   =", my.reps$n2j,
    "\nphi_j =", my.reps$phi.est, "\nse    =", my.reps$se)

## Not run: 
##D # Using the bootstrap approach
##D algorithm3 <- list(FUN = "dummyalgo", alias = "algo3",
##D                    distribution.fun = "rchisq",
##D                    distribution.pars = list(df = 2, ncp = 3))
##D 
##D my.reps  <- calc_nreps2(instance, algorithm1, algorithm3,
##D                         se.max = 0.05, dif = "perc",
##D                         method = "boot", seed = 1234,
##D                         nstart = 20)
##D cat("n1j   =", my.reps$n1j, "\nn2j   =", my.reps$n2j,
##D     "\nphi_j =", my.reps$phi.est, "\nse    =", my.reps$se)
## End(Not run)


## Not run: 
##D # Example for a 21-city TSP instance using 2 configurations of SANN
##D algorithm1 <- list(FUN  = "my.SANN", alias = "algo1",
##D                    Temp = 2000, budget = 10000)
##D algorithm2 <- list(FUN  = "my.SANN", alias = "algo2",
##D                    Temp = 4000, budget = 10000)
##D instance <- list(FUN    = "TSP.dist",
##D                  mydist = datasets::eurodist)
##D my.reps  <- calc_nreps2(instance, algorithm1, algorithm2,
##D                         se.max = 0.01, dif = "perc",
##D                         method = "param", seed = 1234,
##D                         nstart = 20)
##D cat("n1j   =", my.reps$n1j, "\nn2j   =", my.reps$n2j,
##D     "\nphi_j =", my.reps$phi.est, "\nse    =", my.reps$se)
## End(Not run)




