library(BayesianTools)


### Name: createBayesianSetup
### Title: Creates a standardized collection of prior, likelihood and
###   posterior functions, including error checks etc.
### Aliases: createBayesianSetup

### ** Examples

ll <- function(x) sum(dnorm(x, log = TRUE))

test <- createBayesianSetup(ll, prior = NULL, priorSampler = NULL, lower = -10, upper = 10)
str(test)
test$prior$density(0)

test$likelihood$density(c(1,1))
test$likelihood$density(1)
test$posterior$density(1)
test$posterior$density(1, returnAll = TRUE)

test$likelihood$density(matrix(rep(1,4), nrow = 2))
#test$posterior$density(matrix(rep(1,4), nrow = 2), returnAll = TRUE)
test$likelihood$density(matrix(rep(1,4), nrow = 4))

## Not run: 
##D 
##D ## Example of how to use parallelization using the VSEM model
##D # Note that the parallelization produces overhead and is not always
##D # speeding things up. In this example, due to the small
##D # computational cost of the VSEM the parallelization is
##D # most likely to reduce the speed of the sampler.
##D 
##D # Creating reference data
##D PAR <- VSEMcreatePAR(1:1000)
##D refPars   <- VSEMgetDefaults()
##D refPars[12,] <- c(0.2, 0.001, 1)
##D rownames(refPars)[12] <- "error-sd"
##D 
##D referenceData <- VSEM(refPars$best[1:11], PAR) 
##D obs = apply(referenceData, 2, function(x) x + rnorm(length(x), 
##D                                                     sd = abs(x) * refPars$best[12]))
##D 
##D # Selecting parameters
##D parSel = c(1:6, 12)
##D 
##D 
##D ## Builidng the likelihood function
##D likelihood <- function(par, sum = TRUE){
##D   x = refPars$best
##D   x[parSel] = par
##D   predicted <- VSEM(x[1:11], PAR)
##D   diff = c(predicted[,1:3] - obs[,1:3])
##D   llValues = dnorm(diff, sd = max(abs(c(predicted[,1:3])),0.0001) * x[12], log = TRUE) 
##D   if (sum == False) return(llValues)
##D   else return(sum(llValues))
##D }
##D 
##D # Prior
##D prior <- createUniformPrior(lower = refPars$lower[parSel], upper = refPars$upper[parSel])
##D 
##D 
##D ####
##D ## Definition of the packages and objects that are exported to the cluster.
##D # These are the objects that are used in the likelihood function.
##D opts <- list(packages = list("BayesianTools"), variables = list("refPars", "obs", "PAR" ), 
##D              dlls = NULL)
##D 
##D 
##D # Create Bayesian Setup
##D BSVSEM <- createBayesianSetup(likelihood, prior, best = refPars$best[parSel], 
##D                               names = rownames(refPars)[parSel], parallel = 2,
##D                               parallelOptions = opts)
##D 
##D ## The bayesianSetup can now be used in the runMCMC function.
##D # Note that not all samplers can make use of parallel
##D # computing.
##D 
##D # Remove the Bayesian Setup and close the cluster
##D stopParallel(BSVSEM)
##D rm(BSVSEM)
##D 
## End(Not run)



