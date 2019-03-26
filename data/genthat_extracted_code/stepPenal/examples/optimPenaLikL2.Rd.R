library(stepPenal)


### Name: optimPenaLikL2
### Title: Variable selection based on the combined penalty CL2= (1-w)L0 +
###   wL2
### Aliases: optimPenaLikL2

### ** Examples

## Not run: 
##D # use the optimPenaLik function on a simulated dataset, with given lamda and w.
##D set.seed(14)
##D beta    <- c(3, 2, -1.6, -1)
##D noise   <- 5
##D simData <- SimData(N=100, beta=beta, noise=noise, corr=TRUE)
##D 
##D # example with Quasi-Newton:
##D before <- Sys.time()
##D PenalQN <- optimPenaLikL2(Data=simData, lamda=2, w=0.6,
##D                      algorithms=c("QN"))
##D after <- Sys.time()
##D after-before
##D PenalQN
## End(Not run)




