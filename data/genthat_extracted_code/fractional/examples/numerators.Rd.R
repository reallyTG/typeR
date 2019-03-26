library(fractional)


### Name: numerators
### Title: Extract the parts of a fractional object
### Aliases: denominators denominators.charFrac denominators.default
###   denominators.fractional numerators numerators.charFrac
###   numerators.default numerators.fractional

### ** Examples

(pi_approx <- vfractional(base::pi, eps = 0, maxConv = 1:10))
numerators(pi_approx)
denominators(pi_approx)



