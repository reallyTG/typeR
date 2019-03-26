library(bayescount)


### Name: lnormal.params
### Title: Calculate the Log-Normal Mean and Standard Deviation Using the
###   Normal Mean and Standard Deviation
### Aliases: lnormal.params
### Keywords: methods

### ** Examples


## Not run: 
##D mean <- 10
##D sd <- 2
##D lmean <- lnormal.params(mean,sd)[[1]]
##D lsd <- lnormal.params(mean,sd)[[2]]
##D 
##D curve(dnorm(x, mean, sd), from=0, to=20)
##D dev.new()
##D curve(dlnorm(x, lmean, lsd), from=0, to=20)
## End(Not run)



