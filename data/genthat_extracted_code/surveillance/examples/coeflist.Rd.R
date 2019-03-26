library(surveillance)


### Name: coeflist
### Title: List Coefficients by Model Component
### Aliases: coeflist coeflist.default
### Keywords: models utilities

### ** Examples

## the default method just 'split's the coefficient vector
coefs <- c(a = 1, b = 3, dispersion = 0.5)
npars <- c(regression = 2, variance = 1)
coeflist(coefs, npars)



