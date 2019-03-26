library(matchingMarkets)


### Name: khb
### Title: Karlson-Holm-Breen method for comparing probit coefficients
### Aliases: khb
### Keywords: summary

### ** Examples

## 1. load results from Klein (2015a)
 data(klein15a)

## 2. apply KHB method
with(klein15a$variables, khb(X=X, y=Y, z="eta"))



