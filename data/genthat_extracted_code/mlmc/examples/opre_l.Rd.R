library(mlmc)


### Name: opre_l
### Title: Financial options using an Euler-Maruyama discretisation
### Aliases: opre_l

### ** Examples

## Not run: 
##D # These are similar to the MLMC tests for the original
##D # 2008 Operations Research paper, using an Euler-Maruyama
##D # discretisation with 4^l timesteps on level l.
##D #
##D # The differences are:
##D # -- the plots do not have the extrapolation results
##D # -- two plots are log_2 rather than log_4
##D # -- the new MLMC driver is a little different
##D # -- switch to X_0=100 instead of X_0=1
##D 
##D M    <- 4 # refinement cost factor
##D N0   <- 1000 # initial samples on coarse levels
##D Lmin <- 2 # minimum refinement level
##D Lmax <- 6 # maximum refinement level
##D 
##D test.res <- list()
##D for(option in 1:5) {
##D   if(option==1) {
##D     cat("\n ---- Computing European call ---- \n")
##D     N      <- 2000000 # samples for convergence tests
##D     L      <- 5 # levels for convergence tests
##D     Eps    <- c(0.005, 0.01, 0.02, 0.05, 0.1)
##D   } else if(option==2) {
##D     cat("\n ---- Computing Asian call ---- \n")
##D     N      <- 2000000 # samples for convergence tests
##D     L      <- 5 # levels for convergence tests
##D     Eps    <- c(0.005, 0.01, 0.02, 0.05, 0.1)
##D   } else if(option==3) {
##D     cat("\n ---- Computing lookback call ---- \n")
##D     N      <- 2000000 # samples for convergence tests
##D     L      <- 5 # levels for convergence tests
##D     Eps    <- c(0.01, 0.02, 0.05, 0.1, 0.2)
##D   } else if(option==4) {
##D     cat("\n ---- Computing digital call ---- \n")
##D     N      <- 3000000 # samples for convergence tests
##D     L      <- 5 # levels for convergence tests
##D     Eps    <- c(0.02, 0.05, 0.1, 0.2, 0.5)
##D   } else if(option==5) {
##D     cat("\n ---- Computing Heston model ---- \n")
##D     N      <- 2000000 # samples for convergence tests
##D     L      <- 5 # levels for convergence tests
##D     Eps    <- c(0.005, 0.01, 0.02, 0.05, 0.1)
##D   }
##D 
##D   test.res[[option]] <- mlmc.test(opre_l, M, N, L, N0, Eps, Lmin, Lmax, option=option)
##D 
##D   # print exact analytic value, based on S0=K
##D   T   <- 1
##D   r   <- 0.05
##D   sig <- 0.2
##D   K   <- 100
##D 
##D   d1  <- (r+0.5*sig^2)*T / (sig*sqrt(T))
##D   d2  <- (r-0.5*sig^2)*T / (sig*sqrt(T))
##D 
##D   if(option==1) {
##D     val <- K*( pnorm(d1) - exp(-r*T)*pnorm(d2) )
##D     cat(sprintf("\n Exact value: %f, MLMC value: %f \n", val, test.res[[option]]$P[1]))
##D   } else if(option==3) {
##D     k   <- 0.5*sig^2/r
##D     val <- K*( pnorm(d1) - pnorm(-d1)*k - exp(-r*T)*(pnorm(d2) - pnorm(d2)*k) )
##D     cat(sprintf("\n Exact value: %f, MLMC value: %f \n", val, test.res[[option]]$P[1]))
##D   } else if(option==4) {
##D     val <- K*exp(-r*T)*pnorm(d2)
##D     cat(sprintf("\n Exact value: %f, MLMC value: %f \n", val, test.res[[option]]$P[1]))
##D   }
##D 
##D   # plot results
##D   plot(test.res[[option]])
##D }
## End(Not run)

# The level sampler can be called directly to retrieve the relevant level sums:
opre_l(l=7, N=10, option=1)




