library(l2boost)


### Name: coef.l2boost
### Title: Extract model coefficients from an l2boost model object at any
###   point along the solution path indexed by step m. 'coef' is a generic
###   function which extracts model coefficients from objects returned by
###   modeling functions.
### Aliases: coef.l2boost

### ** Examples

#--------------------------------------------------------------------------
# Example: Diabetes data 
#  
# See Efron B., Hastie T., Johnstone I., and Tibshirani R. 
# Least angle regression. Ann. Statist., 32:407-499, 2004.
data(diabetes, package='l2boost')

object <- l2boost(diabetes$x,diabetes$y, M=1000, nu=.01)
coef(object)

# At the m=500 step
coef(object, m=500)




