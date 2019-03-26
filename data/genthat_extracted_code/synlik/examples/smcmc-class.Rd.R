library(synlik)


### Name: smcmc-class
### Title: 'smcmc-class'
### Aliases: smcmc-class

### ** Examples

# Load "synlik" object
data(ricker_sl)

plot(ricker_sl)
 
# MCMC estimation
set.seed(4235)
ricker_sl <- smcmc(ricker_sl, 
                   initPar = c(3.2, -1, 2.6),
                   niter = 50, 
                   burn = 3,
                   priorFun = function(input, ...) 1, 
                   propCov = diag( c(0.1, 0.1, 0.1) )^2, 
                   nsim = 200, 
                   multicore = FALSE)

# Continue with additional 50 iterations
ricker_sl <- continue(ricker_sl, niter = 50)

plot(ricker_sl)       




