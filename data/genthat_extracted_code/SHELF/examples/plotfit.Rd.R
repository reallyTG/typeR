library(SHELF)


### Name: plotfit
### Title: Plot the fitted density function for one or more experts
### Aliases: plotfit

### ** Examples


## Not run: 
##D # Two experts
##D # Expert 1 states P(X<30)=0.25, P(X<40)=0.5, P(X<50)=0.75
##D # Expert 2 states P(X<20)=0.25, P(X<25)=0.5, P(X<35)=0.75
##D # Both experts state 0<X<100. 
##D 
##D v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
##D p <- c(0.25, 0.5, 0.75)
##D myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
##D 
##D # Plot both fitted densities, using the best fitted distribution
##D plotfit(myfit)
##D 
##D # Plot a fitted beta distribution for expert 2, and show 5th and 95th percentiles
##D plotfit(myfit, d = "beta", ql = 0.05, qu = 0.95, ex = 2)
##D 
##D # Use interactive plotting for for expert 2, and show 5th and 95th percentiles
##D plotfit(myfit, int = T, ex = 2)
##D 
##D # Plot a linear pool, giving double weight to expert 1
##D plotfit(myfit,  lp = T, lpw = c(2,1))
##D 
##D # Use interactive plotting, giving double weight to expert 1, if a linear pool is displayed
##D plotfit(myfit,  int = T, lpw = c(2,1))
##D 
##D # Plot a linear pool, giving double weight to expert 1, 
##D # show 5th and 95th percentiles, supress plotting of individual distributions, 
##D # and force use of Beta distributions
##D plotfit(myfit, d = "beta",  lp = T, lpw = c(2,1), ql = 0.05, qu = 0.95, ind=FALSE )
## End(Not run)



