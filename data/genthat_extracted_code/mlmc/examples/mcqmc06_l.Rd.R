library(mlmc)


### Name: mcqmc06_l
### Title: Financial options using a Milstein discretisation
### Aliases: mcqmc06_l

### ** Examples

## Not run: 
##D # These are similar to the MLMC tests for the MCQMC06 paper
##D # using a Milstein discretisation with 2^l timesteps on level l
##D #
##D # The figures are slightly different due to:
##D # -- change in MSE split
##D # -- change in cost calculation
##D # -- different random number generation
##D # -- switch to S_0=100
##D 
##D M    <- 2 # refinement cost factor
##D N0   <- 200 # initial samples on coarse levels
##D Lmin <- 2 # minimum refinement level
##D Lmax <- 10 # maximum refinement level
##D 
##D test.res <- list()
##D for(option in 1:5) {
##D   if(option==1) {
##D     cat("\n ---- Computing European call ---- \n")
##D     N      <- 20000 # samples for convergence tests
##D     L      <- 8 # levels for convergence tests
##D     Eps    <- c(0.005, 0.01, 0.02, 0.05, 0.1)
##D   } else if(option==2) {
##D     cat("\n ---- Computing Asian call ---- \n")
##D     N      <- 20000 # samples for convergence tests
##D     L      <- 8 # levels for convergence tests
##D     Eps    <- c(0.005, 0.01, 0.02, 0.05, 0.1)
##D   } else if(option==3) {
##D     cat("\n ---- Computing lookback call ---- \n")
##D     N      <- 20000 # samples for convergence tests
##D     L      <- 10 # levels for convergence tests
##D     Eps    <- c(0.005, 0.01, 0.02, 0.05, 0.1)
##D   } else if(option==4) {
##D     cat("\n ---- Computing digital call ---- \n")
##D     N      <- 200000 # samples for convergence tests
##D     L      <- 8 # levels for convergence tests
##D     Eps    <- c(0.01, 0.02, 0.05, 0.1, 0.2)
##D   } else if(option==5) {
##D     cat("\n ---- Computing barrier call ---- \n")
##D     N      <- 200000 # samples for convergence tests
##D     L      <- 8 # levels for convergence tests
##D     Eps    <- c(0.005, 0.01, 0.02, 0.05, 0.1)
##D   }
##D 
##D   test.res[[option]] <- mlmc.test(mcqmc06_l, M, N, L, N0, Eps, Lmin, Lmax, option=option)
##D 
##D   # plot results
##D   plot(test.res[[option]])
##D }
## End(Not run)

# The level sampler can be called directly to retrieve the relevant level sums:
mcqmc06_l(l=7, N=10, option=1)




