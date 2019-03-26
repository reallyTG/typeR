library(HMMcopula)


### Name: EstHMMCop
### Title: Estimation of bivariate Markov regime switching bivariate copula
###   model
### Aliases: EstHMMCop

### ** Examples

Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2) ; kendallTau <- c(0.3 ,0.7) ;
data <- SimHMMCop(Q, 'clayton', kendallTau, 10)$SimData;
estimations <- EstHMMCop(data,2,'clayton',10000,0.0001)





