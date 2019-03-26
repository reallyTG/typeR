library(robustlmm)


### Name: chgDefaults
### Title: Change default arguments
### Aliases: chgDefaults chgDefaults,psi_func_rcpp-method
### Keywords: utilities

### ** Examples

sPsi <- chgDefaults(smoothPsi, k=2)
curve(smoothPsi@psi(x), 0, 3)
curve(sPsi@psi(x), 0, 3, color="blue", add=TRUE)



