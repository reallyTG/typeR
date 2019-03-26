library(stepPenal)


### Name: optimPenaLik
### Title: Variable selection based on the combined penalty CL= (1-w)L0 +
###   wL1
### Aliases: optimPenaLik

### ** Examples

# use the optimPenaLik function on a simulated dataset, with given lamda and w.
## Not run: 
##D set.seed(14)
##D beta    <- c(3, 2, -1.6, -1)
##D noise   <- 5
##D simData <- SimData(N=100, beta=beta, noise=noise, corr=TRUE)
##D 
##D # use BFGS
##D 
##D before  <- Sys.time()
##D PenalQN <- optimPenaLik(Data=simData, lamda=1.5, w=0.7,
##D                      algorithms=c("QN"))
##D (tot <- Sys.time()-before)
##D PenalQN
##D 
##D 
##D # use Hooke-Jeeves algorithm
##D 
##D before  <- Sys.time()
##D Penalhjk <- optimPenaLik(Data=simData, lamda=1.5, w=0.7,
##D                        algorithms=c("hjk"))
##D (totRun  <- Sys.time() - before)
##D # total run of approx 0.25sec
##D 
##D Penalhjk
## End(Not run)




