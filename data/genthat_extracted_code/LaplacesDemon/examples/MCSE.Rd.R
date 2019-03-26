library(LaplacesDemon)


### Name: MCSE
### Title: Monte Carlo Standard Error
### Aliases: MCSE MCSS
### Keywords: Diagnostic MCMC MCSE MCSS Utility

### ** Examples

library(LaplacesDemon)
x <- rnorm(1000)
MCSE(x)
MCSE(x, method="batch.means")
MCSE(x, method="sample.variance")
MCSS(x, a=0.01)



