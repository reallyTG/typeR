library(MixedPoisson)


### Name: lambda_m_step
### Title: Estimation of Lambda in M-step - Expectation-Maximization (EM)
###   algorithm
### Aliases: lambda_m_step

### ** Examples

set.seed(1234)
variable=rpois(50,4)
X=as.matrix(rep(1, length(variable)))
t=pseudo_values(variable, mixing=c("invGauss"), lambda=4, delta=1, n=100)
lambda_m_step(variable, X, offset=t$pseudo_values)



