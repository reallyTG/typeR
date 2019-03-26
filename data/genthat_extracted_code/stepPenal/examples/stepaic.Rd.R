library(stepPenal)


### Name: stepaic
### Title: Stepwise forward variable selection based on the AIC criterion
### Aliases: stepaic

### ** Examples

## Not run: 
##D set.seed(14)
##D beta    <- c(3, 2, -1.6, -4)
##D noise   <- 5
##D simData <- SimData(N=100, beta=beta, noise=noise, corr=FALSE)
##D 
##D stepaicfit <- stepaic(Data=simData)
##D stepaicfit
## End(Not run)



