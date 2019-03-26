library(HMMcopula)


### Name: SimMixtureCop
### Title: Simulation of bivariate mixture copula model
### Aliases: SimMixtureCop

### ** Examples

Q <- matrix(c(0.8, 0.2),1,2) ; kendallTau <- c(0.3 ,0.7) ;
simulations <- SimMixtureCop(Q, 'gaussian', kendallTau, 300)






