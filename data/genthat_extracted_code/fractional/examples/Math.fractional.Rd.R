library(fractional)


### Name: Math.fractional
### Title: Method for the group generic function for the elementary
###   mathematical functions
### Aliases: Math.fractional

### ** Examples

(M <- fractional(solve(cbind(1, contr.helmert(5)))))
(M0 <- abs(M)*sign(M))  ## fractional flag lost



