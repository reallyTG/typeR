library(robustbase)


### Name: chgDefaults-methods
### Title: Change Defaults (Parameters) of "Psi Function" Objects
### Aliases: chgDefaults chgDefaults-methods chgDefaults,ANY-method
###   chgDefaults,psi_func-method
### Keywords: methods

### ** Examples

## Hampel's psi and rho:
H.38 <- chgDefaults(hampelPsi, k = c(1.5, 3.5, 8))
H.38
plot(H.38)
## for more see  ?psiFunc



