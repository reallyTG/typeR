library(breakpoint)


### Name: CE.Normal.Init.Mean
### Title: Multiple break-point detection via the CE method for continuous
###   data with initial locations (mean levels)
### Aliases: CE.Normal.Init.Mean

### ** Examples

## Not run: 
##D 
##D simdata <- as.data.frame(c(rnorm(200,100,5),rnorm(100,300,5),rnorm(300,150,5)))
##D 
##D ## CE with four parameter beta distribution with mBIC as the selection criterion  ##
##D obj1 <- CE.Normal.Init.Mean(simdata, init.locs = c(150, 380), distyp = 1, parallel =TRUE)
##D profilePlot(obj1, simdata)
##D 
##D ## CE with truncated normal distribution with mBIC as the selection criterion  ##
##D obj2 <- CE.Normal.Init.Mean(simdata, init.locs = c(150, 380), distyp = 2, parallel =TRUE)
##D profilePlot(obj2, simdata)
## End(Not run)



