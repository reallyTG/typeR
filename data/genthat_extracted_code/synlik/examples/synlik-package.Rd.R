library(synlik)


### Name: synlik-package
### Title: Synthetic Likelihood Methods for Intractable Likelihoods
### Aliases: synlik-package
### Keywords: Intractable Likelihood, Simulation-based inference.

### ** Examples


## Not run: 
##D #### Here I put a simple example, 
##D #### if you want to see more type: vignette("synlik")
## End(Not run)

#### Create synlik object
ricker_sl <- synlik(simulator = rickerSimul,
                    summaries = rickerStats,
                    param = c(logR = 3.8, logSigma = log(0.3), logPhi = log(10)),
                    extraArgs = list("nObs" = 50, "nBurn" = 50),
                    plotFun = function(input, ...){
                               plot(drop(input), type = 'l', ylab = "Pop", xlab = "Time", ...)
                            }
)

#### Simulate from the object
ricker_sl@data <- simulate(ricker_sl)
ricker_sl@extraArgs$obsData <- ricker_sl@data

#### Simulate statistics (each row is a vector of statistics)
simulate(ricker_sl, seed = 523, nsim = 10, stats = TRUE)

#### Plotting the data
plot(ricker_sl)

#### Checking multivariate normality of the statistics
checkNorm(ricker_sl)

#### Evaluate the likelihood
set.seed(4234)
slik(ricker_sl, 
     param  = c(logR = 3.8, logSigma = log(0.3), logPhi = log(10)),
     nsim    = 1e3)

#### Plotting a slice of the log-Likelihood possibly using multiple cores
slice(object = ricker_sl, 
      ranges = list("logR" = seq(3.5, 3.9, by = 0.02),
                    "logPhi" = seq(2, 2.6, by = 0.02),
                    "logSigma" = seq(-2, -0.5, by = 0.05)), 
      param = c(logR = 3.8, logSigma = log(0.3), logPhi = log(10)), 
      nsim = 500, multicore = FALSE)

#### MCMC estimation possibly using multiple cores
set.seed(4235)
ricker_sl <- smcmc(ricker_sl, 
                   initPar = c(3.2, -1, 2.6),
                   niter = 50, 
                   burn = 3,
                   priorFun = function(input, ...) 0, 
                   propCov = diag(c(0.1, 0.1, 0.1))^2, 
                   nsim = 1e3, 
                   multicore = FALSE)

# Continue with additional 50 iterations
ricker_sl <- continue(ricker_sl, niter = 50)

# Plotting results on transformed scale (exponential)
trans <- rep("exp", 3)
names(trans) <- names(ricker_sl@param)

plot(ricker_sl)



