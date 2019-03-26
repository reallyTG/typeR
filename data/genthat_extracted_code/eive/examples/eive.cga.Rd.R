library(eive)


### Name: eive.cga
### Title: Errors-in-variable estimation in linear regression with compact
###   genetic algorithms
### Aliases: eive.cga

### ** Examples

# Creating an artificial data

# Loading required package
require ("eive")

# Setting random number generator seed to 12345
# so each time the script runs, same numbers will
# be generated
set.seed(12345)

# Number of observations is set to 30
n<-30

# Unobserved X values are drawn from a Normal distribution
# with mean 10 and variance 7
clean.x <- rnorm(n, mean=10, sd=sqrt(7))

# Measurement error values are dranw from a Normal distribution
# with mean 0 and variance 3
delta.x <- rnorm(n, mean=0,  sd=sqrt(3))

# Error term of regression. Normally distributed with mean 0 and 
# variance 5
e <- rnorm(n, mean=0, sd=sqrt(5))

# Generating Y values using the linear model
# In this model, intercept is 20 and slope is 10. 
y<- 20 + 10* clean.x + e

# Generating observed X values by adding measurement errors
# to unobserved X
dirty.x <- clean.x + delta.x

# Performs a genetic search to find dummy variables that
# used in two stage least squares.
# Please un-comment the line below
# result <- eive.cga (dirtyx=dirty.x, y=y, numdummies=10)

# Print the result
# Please un-comment the line below
# print(result)

########################################### OUTPUT #############################################
# $ols
#
# Call:
# lm(formula = y ~ dirtyx)
# 
# Coefficients:
# (Intercept)       dirtyx  
#     63.590        5.533  
#
#
# $eive
# 
# Call:
# lm(formula = y ~ ols.proxy$fitted.values)
#
# Coefficients:
#            (Intercept)  ols.proxy$fitted.values  
#                 23.863                    9.229  
#
#
# $proxy
#
# Call:
# lm(formula = dirtyx ~ matrix(best, nrow = n))
# 
# Coefficients:
#              (Intercept)   matrix(best, nrow = n)1   matrix(best, nrow = n)2  
#                 12.9321                   -0.6252                   -1.9923  
# matrix(best, nrow = n)3   matrix(best, nrow = n)4   matrix(best, nrow = n)5  
#                  0.7537                   -0.7076                   -0.5247  
# matrix(best, nrow = n)6   matrix(best, nrow = n)7   matrix(best, nrow = n)8  
#                 -0.9196                   -2.0802                   -0.9246  
# matrix(best, nrow = n)9  matrix(best, nrow = n)10  
#                 -0.6164                    1.9694  
######################################### END OF OUTPUT ##########################################




