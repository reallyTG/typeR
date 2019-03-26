library(l2boost)


### Name: l2boost
### Title: Generic gradient descent boosting method for linear regression.
### Aliases: l2boost l2boost.default l2boost.formula l2boost
###   l2boost.default l2boost l2boost.formula l2boost.default

### ** Examples

#--------------------------------------------------------------------------
# Example 1: Diabetes data
#  
# See Efron B., Hastie T., Johnstone I., and Tibshirani R. 
# Least angle regression. Ann. Statist., 32:407-499, 2004.
data(diabetes, package="l2boost")

l2.object <- l2boost(diabetes$x,diabetes$y, M=1000, nu=.01)

# Plot the boosting rho, and regression beta coefficients as a function of
# boosting steps m
#
# Note: The selected coordinate trajectories are colored in red after selection, and 
# blue before. Unselected coordinates are colored grey.
#
par(mfrow=c(2,2))
plot(l2.object)
plot(l2.object, type="coef")

# increased shrinkage and number of iterations.
l2.shrink <- l2boost(diabetes$x,diabetes$y,M=5000, nu=1.e-3) 
plot(l2.shrink)
plot(l2.shrink, type="coef")

## Not run: 
##D #--------------------------------------------------------------------------
##D # Example 2: elasticBoost simulation
##D # Compare l2boost and elastic net boosting
##D # 
##D # See Zou H. and Hastie T. Regularization and variable selection via the 
##D # elastic net. J. Royal Statist. Soc. B, 67(2):301-320, 2005
##D set.seed(1025)
##D 
##D # The default simulation uses 40 covariates with signal concentrated on 
##D # 3 groups of 5 correlated covariates (for 15 signal covariates)
##D dta <- elasticNetSim(n=100)
##D 
##D # l2boost the simulated data with groups of correlated coordinates
##D l2.object <- l2boost(dta$x,dta$y,M=10000, nu=1.e-3, lambda=NULL)
##D 
##D par(mfrow=c(2,2))
##D # plot the l2boost trajectories over all M
##D plot(l2.object, main="l2Boost nu=1.e-3")
##D # Then zoom into the first m=500 steps
##D plot(l2.object, xlim=c(0,500), ylim=c(.25,.5), main="l2Boost nu=1.e-3")
##D 
##D # elasticNet same data with L1 parameter lambda=0.1
##D en.object <- l2boost(dta$x,dta$y,M=10000, nu=1.e-3, lambda=.1) 
##D 
##D # plot the elasticNet trajectories over all M
##D #
##D # Note 2: The elasticBoost selects all coordinates close to the selection boundary,
##D # where l2boost leaves some unselected (in grey)
##D plot(en.object, main="elasticBoost nu=1.e-3, lambda=.1")
##D # Then zoom into the first m=500 steps
##D plot(en.object, xlim=c(0,500), ylim=c(.25,.5),
##D   main="elasticBoost nu=1.e-3, lambda=.1")
## End(Not run)




