library(breakpoint)


### Name: CE.Normal.MeanVar
### Title: Multiple break-point detection via the CE method for continuous
###   data (both mean and variance changes)
### Aliases: CE.Normal.MeanVar

### ** Examples

## Not run: 
##D 
##D simdata <- as.data.frame(c(rnorm(200,100,5),rnorm(1000,160,8),rnorm(300,120,10)))
##D 
##D ## CE with four parameter beta distribution with BIC as the selection criterion  ##
##D obj1 <- CE.Normal.MeanVar(simdata, distyp = 1, penalty = "BIC", parallel =TRUE)
##D profilePlot(obj1, simdata)
##D 
##D ## CE with truncated normal distribution with BIC as the selection criterion  ##
##D obj2 <- CE.Normal.MeanVar(simdata, distyp = 2, penalty = "BIC", parallel =TRUE)
##D profilePlot(obj2, simdata)
## End(Not run)



