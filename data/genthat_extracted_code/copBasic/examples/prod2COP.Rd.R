library(copBasic)


### Name: prod2COP
### Title: The Product of Two Copulas
### Aliases: prod2COP
### Keywords: copula operator Nelsen (2006) Examples and Exercises

### ** Examples

## Not run: 
##D # Product P * N4212 ---> P (by identity)
##D u <- c(0.41, 0.87); v <- c(0.13,0.35)
##D prod2COP(u,v, cop1=P, cop2=N4212cop, para1=NA, para2=2.12) # 0.0533 and 0.3045
##D COP(u,v, cop=P)                                            # 0.0533 and 0.3045
## End(Not run)

## Not run: 
##D para <- list(cop1=PLcop, para1=0.19, cop2=PLcop, para2=34.5)
##D UV <- simCOP(n=1000, cop=prod2COP, para=para)
##D # This is large simulation run (with a lot of numerical operations) is expected
##D # at least for the Placketts and chosen parameters to trigger one or more NAs
##D # from derCOPinv().  The simCOP() function simply continues on with ignoring the
##D # solution or lack thereof for certain combinations, and simCOP() will report how
##D # many of the simulated values for sample of size n were computed. For example,
##D # for one n=1000, some 965 simulated values were returned. The Spearman Rho is
##D rhoCOP(cop=prod2COP, para=para) # -0.4271195 (theoretical)
##D rhoCOP(para=UV, as.sample=TRUE) # -0.4284223 (the test n=1000 --> n=965 sample)
## End(Not run)



