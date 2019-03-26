library(stepPenal)


### Name: findROC
### Title: Compute the area under the ROC curve
### Aliases: findROC

### ** Examples

## Not run: 
##D set.seed(14)
##D beta    <- c(3, 2, -1.6, -4)
##D noise   <- 5
##D simData <- SimData(N=100,beta=beta, noise=noise, corr=FALSE)
##D 
##D stepPenal<- StepPenal(Data=simData, lamda=1.2, w=0.7)
##D 
##D (coeffP <- stepPenal$coeffP)
##D 
##D findROC(simData, coeff=coeffP)
## End(Not run)



