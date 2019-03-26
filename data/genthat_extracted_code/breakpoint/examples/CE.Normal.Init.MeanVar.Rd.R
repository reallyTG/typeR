library(breakpoint)


### Name: CE.Normal.Init.MeanVar
### Title: Multiple break-point detection via the CE method for continuous
###   data with initial locations (both mean and variance changes)
### Aliases: CE.Normal.Init.MeanVar

### ** Examples

## Not run: 
##D 
##D simdata <- as.data.frame(c(rnorm(200,100,5),rnorm(1000,160,8),rnorm(300,120,10)))
##D initial.locs <- c(225, 1300)
##D 
##D ## CE with four parameter beta distribution with BIC as the selection criterion  ##
##D obj1 <- CE.Normal.Init.MeanVar(simdata, init.locs = initial.locs, distyp = 1, parallel =TRUE)
##D profilePlot(obj1, simdata)
##D 
##D ## CE with truncated normal distribution with BIC as the selection criterion  ##
##D obj2 <- CE.Normal.Init.MeanVar(simdata, init.locs = initial.locs, distyp = 2, parallel =TRUE)
##D profilePlot(obj2, simdata)
## End(Not run)



