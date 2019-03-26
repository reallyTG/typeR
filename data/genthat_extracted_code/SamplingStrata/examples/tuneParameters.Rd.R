library(SamplingStrata)


### Name: tuneParameters
### Title: Execution and compared evaluation of optimization runs
### Aliases: tuneParameters
### Keywords: survey

### ** Examples

#
## Not run: 
##D #------------------------------------------------------------
##D # data setting
##D library(SamplingStrata)
##D data(swissstrata)
##D data(swisserrors)
##D data(swissframe)
##D # As this function can be applied only to a given domain per time,
##D # we select the first domain
##D frame <- swissframe[swissframe$domainvalue == 1,]
##D strata <- swissstrata[swissstrata$DOM1 == 1,]
##D errors <- swisserrors[swisserrors$domainvalue == 1,]
##D #------------------------------------------------------------
##D # parameters setting
##D noptim <- 10 # Number of runs
##D nsampl <- 100 # Number of samples to be drawn after each optimization
##D initialStrata <- ceiling(c(1:noptim)*0.1*(nrow(strata))) # Number of initial strata
##D addStrataFactor <- rep(0.01,noptim) # Rate for increasing initial strata
##D minnumstr <- rep(2,noptim) # Minimum number of units per stratum
##D iter <- rep(200,noptim) # Number of iterations for each optimization
##D pops <- rep(20,noptim) # Number of solutions for each iteration
##D mut_chance <- rep(0.004,noptim) # Mutation chance
##D elitism_rate <- rep(0.2,noptim) # Elitism rate
##D #------------------------------------------------------------
##D results <- tuneParameters (
##D   noptim,
##D   nsampl,
##D   frame,
##D   errors = errors, 
##D   strata = strata,
##D   cens = NULL, 
##D   strcens = FALSE,
##D   alldomains = FALSE,
##D   dom = 1,			
##D   initialStrata, 
##D   addStrataFactor, 
##D   minnumstr, 
##D   iter, 
##D   pops, 
##D   mut_chance, 
##D   elitism_rate
##D   )
##D results
## End(Not run)



