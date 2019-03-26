library(rotations)


### Name: MCMCSO3
### Title: MCMC for rotation data
### Aliases: MCMCSO3 MCMCSO3.Q4 MCMCSO3.SO3

### ** Examples

#Not run due to time constraints
## Not run: 
##D Rs <- ruars(20, rvmises, kappa = 10)
##D draws <- MCMCSO3(Rs, type = "Fisher", S0 = mean(Rs), kappa0 = 10, tuneS = 5000,
##D                  tuneK = 1,burn_in = 1000, m = 5000)
## End(Not run)



