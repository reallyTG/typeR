library(mistral)


### Name: MonotonicQuantileEstimation
### Title: Quantile estimation under monotonicity constraints
### Aliases: MonotonicQuantileEstimation

### ** Examples

## Not run: 
##D  inputDistribution <- list()
##D  inputDistribution[[1]] <- list("norm",c(4,1))
##D  inputDistribution[[2]] <- list("norm",c(0,1))
##D 
##D  inputDimension <- length(inputDistribution)
##D  dir.monot <- c(1, -1)
##D  N.calls <- 80
##D 
##D  f <- function(x){
##D    return(x[1] - x[2])
##D  }
##D 
##D  probability <- 1e-2
##D 
##D  trueQuantile <- qnorm(probability,
##D                      inputDistribution[[1]][[2]][1] - inputDistribution[[2]][[2]][1],
##D                      sqrt(inputDistribution[[1]][[2]][2] + inputDistribution[[1]][[2]][2]))
##D 
##D  resQuantile <- MonotonicQuantileEstimation(f, inputDimension, inputDistribution,
##D                                       dir.monot, N.calls, p = probability, method = "MonteCarloIS")
##D 
##D  quantileEstimate <- resQuantile[[1]][N.calls, 3]
##D 
## End(Not run)



