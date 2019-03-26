library(MixedPoisson)


### Name: lambda_start
### Title: Estimation of starting lambda in Expectation-Maximization (EM)
###   algorithm
### Aliases: lambda_start

### ** Examples

set.seed(1234)
variable=rpois(50,4)
X=as.matrix(rep(1, length(variable)))
t=pseudo_values(variable, mixing=c("invGauss"), lambda=4, delta=1, n=100)
lambda_m_step(variable, X, offset=t$pseudo_values)



