library(circular)


### Name: mle.wrappednormal
### Title: Wrapped Normal Maximum Likelihood Estimates
### Aliases: mle.wrappednormal print.mle.wrappednormal
### Keywords: htest

### ** Examples

x <- rwrappednormal(n=50, mu=circular(0), rho=0.5)
mle.wrappednormal(x) # estimation of mu and rho (and sd)
mle.wrappednormal(x, mu=circular(0)) # estimation of rho (and sd) only



