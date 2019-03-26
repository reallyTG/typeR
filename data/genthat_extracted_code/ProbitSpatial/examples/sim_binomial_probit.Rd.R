library(ProbitSpatial)


### Name: sim_binomial_probit
### Title: Simulate the dependent variable of a SAR/SEM/SARAR model.
### Aliases: sim_binomial_probit

### ** Examples

n <- 1000
nneigh <- 3
rho <- 0.5
beta <- c(4,-2,1)
W <- generate_W(n,nneigh)
X <- cbind(1,rnorm(n,2,2),rnorm(n,0,1))
y <- sim_binomial_probit(W,X,beta,rho,model="SAR") #SAR model
y <- sim_binomial_probit(W,X,beta,rho,model="SEM") #SEM model
M <- generate_W(n,nneigh,seed=1)
lambda <- -0.5
y <- sim_binomial_probit(W,X,beta,rho,model="SARAR",M=M,lambda=lambda) #SARAR 




