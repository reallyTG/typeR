library(bayescount)


### Name: normal.params
### Title: Calculate the Normal Mean and Standard Deviation Using the
###   Log-Normal Mean and Standard Deviation
### Aliases: normal.params
### Keywords: methods

### ** Examples


## Not run: 
##D lmean <- 2.5
##D lsd <- 0.2
##D mean <- normal.params(lmean,lsd)[[1]]
##D sd <- normal.params(lmean,lsd)[[2]]
##D 
##D curve(dlnorm(x, lmean, lsd), from=0, to=25)
##D dev.new()
##D curve(dnorm(x, mean, sd), from=0, to=25)
## End(Not run)




