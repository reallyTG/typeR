library(stepPenal)


### Name: StepPenalL2
### Title: Stepwise forward variable selection using penalized regression.
### Aliases: StepPenalL2

### ** Examples

# use the StepPenal function on a simulated dataset, with given lamda and w.

set.seed(14)
beta    <- c(3, 2, -1.6, -1)
noise   <- 5
simData <- SimData(N=100, beta=beta, noise=noise, corr=TRUE)
## Not run: 
##D before <- Sys.time()
##D stepPenalL2 <- StepPenalL2(Data=simData, lamda=1.5, w=0.6)
##D after <- Sys.time()
##D after-before
##D 
##D (varstepPenal<- stepPenalL2$coeffP)
## End(Not run)



