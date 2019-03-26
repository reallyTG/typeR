library(VGAM)


### Name: reciprocal
### Title: Reciprocal Link Function
### Aliases: reciprocal negreciprocal
### Keywords: math models regression

### ** Examples

   reciprocal(1:5)
   reciprocal(1:5, inverse = TRUE, deriv = 2)
negreciprocal(1:5)
negreciprocal(1:5, inverse = TRUE, deriv = 2)

x <- (-3):3
reciprocal(x)  # Has Inf
reciprocal(x, bvalue = .Machine$double.eps)  # Has no Inf



