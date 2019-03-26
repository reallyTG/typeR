library(HMMcopula)


### Name: SimHMMCop
### Title: Simulation of bivariate Markov regime switching copula model
### Aliases: SimHMMCop

### ** Examples

Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2) ; kendallTau <- c(0.3 ,0.7) ;
simulations <- SimHMMCop(Q, 'gumbel', kendallTau, 300)





