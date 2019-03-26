library(l2boost)


### Name: plot.l2boost
### Title: Plotting for 'l2boost' objects.
### Aliases: plot.l2boost

### ** Examples

#--------------------------------------------------------------------------
# Example: Diabetes 
#  
# See Efron B., Hastie T., Johnstone I., and Tibshirani R. 
# Least angle regression. Ann. Statist., 32:407-499, 2004.
data(diabetes, package = "l2boost")

l2.object <- l2boost(diabetes$x,diabetes$y, M=1000, nu=.01)

# Plot the gradient-correlation, and regression beta coefficients as a function of
# boosting steps m
par(mfrow=c(2,2))
plot(l2.object)
abline(v=500, lty=2, col="grey")
plot(l2.object, type="coef")
abline(v=500, lty=2, col="grey")

# limit the plot to only the first 500 steps of the algorithm 
# (grey vertical line in previous plots).
plot(l2.object, xlim=c(0,500))
plot(l2.object, type="coef", xlim=c(0,500))

## Not run: 
##D #--------------------------------------------------------------------------
##D # Example: Plotting cross-validation objects
##D dta <- elasticNetSim(n=100)
##D # Set the boosting parameters
##D Mtarget = 1000
##D nuTarget = 1.e-2
##D 
##D cv.l2 <- cv.l2boost(dta$x,dta$y,M=Mtarget, nu=nuTarget, lambda=NULL)
##D 
##D # Show the CV MSE plot, with a marker at the "optimal iteration"
##D plot(cv.l2)
##D abline(v=cv.l2$opt.step, lty=2, col="grey")
##D 
##D # Show the l2boost object plots.
##D plot(cv.l2$fit)
##D abline(v=cv.l2$opt.step, lty=2, col="grey")
##D  
##D plot(cv.l2$fit, type="coef")
##D abline(v=cv.l2$opt.step, lty=2, col="grey")
##D 
##D # Create a color vector of length p=40 (from elasticNetSim defaults)
##D clr <- rep("black", 40)
##D # Set coordinates in the boosting path to color red.
##D clr[unique(cv.l2$fit$l.crit)] = "red"
##D 
##D # Show the "optimal" coefficient values, 
##D # red points are selected in boosting algorithm.
##D plot(coef(cv.l2$fit, m=cv.l2$opt.step), col=clr, ylab=expression(beta))
## End(Not run)




