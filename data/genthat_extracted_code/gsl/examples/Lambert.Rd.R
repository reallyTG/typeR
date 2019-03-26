library(gsl)


### Name: Lambert
### Title: Lambert's W function
### Aliases: Lambert lambert lambert_W0 lambert_Wm1 Lambert_W0 Lambert_Wm1
### Keywords: array

### ** Examples

a <- runif(6)
L <- lambert_W0(a)
print(L*exp(L) - a)



