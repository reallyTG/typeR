library(kedd)


### Name: h.bcv
### Title: Biased Cross-Validation for Bandwidth Selection
### Aliases: h.bcv h.bcv.default print.h.bcv
### Keywords: smooth bandwidth selection nonparametric

### ** Examples

## EXAMPLE 1:

x <- rnorm(100)
h.bcv(x,whichbcv = 1, deriv.order = 0)
h.bcv(x,whichbcv = 2, deriv.order = 0)

## EXAMPLE 2:

## Derivative order = 0

h.bcv(kurtotic,deriv.order = 0)

## Derivative order = 1

h.bcv(kurtotic,deriv.order = 1)



