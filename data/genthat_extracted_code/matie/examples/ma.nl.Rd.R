library(matie)


### Name: ma.nl
### Title: Calculates degree of nonlinearity for a particular association
###   score.
### Aliases: ma.nl
### Keywords: nonlinear

### ** Examples

    X1 = runif(1000)
    X2 = runif(1000)
    Y = sin(0.5*pi*X1) + sin(0.5*pi*X2) + rnorm(1000)*0.000001
    ma.nl(Y,cbind(X1,X2))
    #
    # in the case of bivariate associations all these measures
    # are symmetric apart from rA, the residual association
    X = runif(1000)
    Y = sin(0.5*pi*X) + rnorm(1000)*0.01
    ma.nl(Y,X)$rA
    ma.nl(X,Y)$rA



