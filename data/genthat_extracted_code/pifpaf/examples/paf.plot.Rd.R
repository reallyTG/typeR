library(pifpaf)


### Name: paf.plot
### Title: Plot of Population Attributable Fraction under different values
###   of Relative Risk's parameter theta
### Aliases: paf.plot

### ** Examples


## Not run: 
##D #Example 1: Exponential Relative Risk empirical method
##D #-----------------------------------------------------
##D set.seed(18427)
##D X <- data.frame(Exposure = rbeta(25, 4.2, 10))
##D paf.plot(X, thetalow = 0, thetaup = 2, function(X, theta){exp(theta*X)})
##D 
##D 
##D #Same example with kernel method
##D paf.plot(X, 0, 2, function(X, theta){exp(theta*X)}, method = "kernel",
##D title = "Kernel method example") 
##D  
##D #Same example for approximate method
##D Xmean <- data.frame(mean(X[,"Exposure"]))
##D Xvar  <- var(X)
##D paf.plot(Xmean, 0, 2, function(X, theta){exp(theta*X)}, 
##D method = "approximate", Xvar = Xvar, title = "Approximate method example")
## End(Not run)




