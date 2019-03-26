library(LaplacesDemon)


### Name: Hangartner.Diagnostic
### Title: Hangartner's Convergence Diagnostic
### Aliases: Hangartner.Diagnostic
### Keywords: Diagnostic MCMC

### ** Examples

library(LaplacesDemon)
N <- 1000
K <- 3
x <- rcat(N, rep(1/K,K))
hd <- Hangartner.Diagnostic(x, J=2)
hd



