library(MHTrajectoryR)


### Name: Analyze_oneAE
### Title: Signal detection using via variable selection in logistic
###   regression. The Bayesian Information Criterion maximization is
###   assessed using Metropolis-Hastings algorithm.
### Aliases: Analyze_oneAE
### Keywords: Binary data Logistic regression Metropolis-Hastings algorithm
###   Bayesian Information Criterion Variable selection Spontaneous
###   reporting

### ** Examples

## Not run: 
##D   data(exampleAE)
##D   data(exampleDrugs)
##D   res <- Analyze_oneAE(exampleAE[,1], exampleDrugs, 10, 1, 10)
##D   # print signals (drugs relied to the adverse event)
##D   print(res$signal)
## End(Not run)



