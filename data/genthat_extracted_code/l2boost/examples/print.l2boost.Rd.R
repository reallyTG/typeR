library(l2boost)


### Name: print.l2boost
### Title: print method for 'l2boost' and 'cv.l2boost' objects.
### Aliases: print.l2boost

### ** Examples

#--------------------------------------------------------------------------
# Example 1: Diabetes 
#  
# See Efron B., Hastie T., Johnstone I., and Tibshirani R. 
# Least angle regression. Ann. Statist., 32:407-499, 2004.
data(diabetes)

object <- l2boost(diabetes$x,diabetes$y, M=1000, nu=.01)

# A summary of the l2boost object at M=1000
print(object)

# Similar at m=100
print(object, m=100)




