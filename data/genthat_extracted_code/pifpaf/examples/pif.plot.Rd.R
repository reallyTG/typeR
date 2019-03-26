library(pifpaf)


### Name: pif.plot
### Title: Plot of Potential Impact Fraction under different values of
###   Relative Risk's parameter theta
### Aliases: pif.plot

### ** Examples


#Example 1: Exponential Relative Risk empirical method
#-----------------------------------------------------
## Not run: 
##D set.seed(18427)
##D X <- data.frame(Exposure = rbeta(25, 4.2, 10))
##D pif.plot(X, thetalow = 0, thetaup = 10, rr =  function(X, theta){exp(theta*X)})
##D 
##D #Same example with kernel method
##D pif.plot(X, thetalow = 0, thetaup = 10, rr =  function(X, theta){exp(theta*X)}, 
##D method = "kernel", title = "Kernel method example") 
##D  
##D #Same example for approximate method. Notice that approximate method has 
##D #more uncertainty
##D Xmean <- data.frame(mean(X[,"Exposure"]))
##D Xvar  <- var(X)
##D pif.plot(Xmean, thetalow = 0, thetaup = 10, rr =  function(X, theta){exp(theta*X)}, 
##D method = "approximate", Xvar = Xvar, title = "Approximate method example")
##D 
##D #Example with counterfactual
##D pif.plot(X, thetalow = -10, thetaup = -5, rr = function(X, theta){exp(theta*X)}, 
##D cft = function(X){sqrt(X)})
##D 
##D #Example for approximate method with square root counterfactual
##D #Notice how the approximate represents information loss and thus the interval
##D #loses precision.
##D pif.plot(Xmean, thetalow = -10, thetaup = -5, rr = function(X, theta){exp(theta*X)},  
##D cft = function(X){sqrt(X)}, method = "approximate", Xvar = Xvar) 
## End(Not run)




