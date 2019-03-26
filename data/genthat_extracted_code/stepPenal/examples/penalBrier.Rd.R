library(stepPenal)


### Name: penalBrier
### Title: Evaluation of the performance of risk prediction models with
###   binary status response variable.
### Aliases: penalBrier

### ** Examples

# use the penalBrier function on a simulated dataset, with given lamda and w.
## Not run: 
##D set.seed(14)
##D beta    <- c(3, 2, -1.6, -4)
##D noise   <- 5
##D simData <- SimData(N=100,beta=beta, noise=noise, corr=FALSE)
##D 
##D before   <- Sys.time()
##D stepPenal<- StepPenal(Data=simData, lamda=1.2, w=0.4)
##D (totRun  <- Sys.time() - before)
##D 
##D (coeff<- stepPenal$coeffP)
##D  me <- penalBrier(simData,coeff)
## End(Not run)



