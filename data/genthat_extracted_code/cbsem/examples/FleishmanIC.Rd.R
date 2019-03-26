library(cbsem)


### Name: FleishmanIC
### Title: Functions to generate nonnormal distributed multivariate random
###   vectors with mean=0, var=1 and given correlations and coefficients of
###   skewness and excess kurtosis. This is done with the method of Vale &
###   Morelli: The coefficients of the Fleishman transform Y = -c + bX
###   +cX^2 + dX^3 are computed.  from given skewness gamma[1] = E(Y^3) and
###   kurtosis gamma[2] = E(Y^4) - 3. A indermediate correlation matrix is
###   computed from the desired correlation matrix and the Fleishman
###   coefficients. A singular value decomposition of the indermediate
###   correlation matrix is performed and a matrix of independend normal
###   random numbers is generated and transformed into correlated ones.
###   Finally the Fleishman transform is applied to the columns of this
###   data matrix.
### Aliases: FleishmanIC

### ** Examples

out <- FleishmanIC(1,2)




