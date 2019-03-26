library(stepPenal)


### Name: StepPenal
### Title: Stepwise forward variable selection using penalized regression.
### Aliases: StepPenal

### ** Examples

# use the StepPenal function on a simulated dataset, with given lamda and w.

set.seed(14)
beta    <- c(3, 2, -1.6, -1)
noise   <- 5
simData <- SimData(N=100, beta=beta, noise=noise, corr=FALSE)
## Not run: 
##D before <- Sys.time()
##D stepPenal<- StepPenal(Data=simData, lamda=1.5, w=0.3)
##D after <- Sys.time()
##D after-before
##D 
##D (varstepPenal<- stepPenal$coeffP)
## End(Not run)



