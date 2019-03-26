library(l2boost)


### Name: predict.l2boost
### Title: predict method for l2boost models.
### Aliases: predict.l2boost

### ** Examples

#--------------------------------------------------------------------------
# Example 1: Diabetes 
#  
# See Efron B., Hastie T., Johnstone I., and Tibshirani R. 
# Least angle regression. Ann. Statist., 32:407-499, 2004.
data(diabetes)

object <- l2boost(diabetes$x,diabetes$y, M=1000, nu=.01)

# With no arguments returns the estimates at the full M from the training data.
prd <- predict(object)
prd$yhat

# at step m=600
prd$yhat.path[[600]]

# Also can return coefficient estimates. This is equivalent to \code{coef.l2boost}
cf <- predict(object, type="coef")
cf$coef

# at step m=600
cf$coef.path[[600]]

# Or used to predict new data, in this case a subset of training data
cbind(diabetes$y[1:5], predict(object, xnew=diabetes$x[1:5,])$yhat)




