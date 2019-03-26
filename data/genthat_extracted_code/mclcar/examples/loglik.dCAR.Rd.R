library(mclcar)


### Name: loglik.dCAR
### Title: Likelihood computing and parameter estimation for a direct CAR
###   model.
### Aliases: loglik.dCAR ploglik.dCAR get.beta.lm sigmabeta mple.dCAR
### Keywords: CAR likelihood

### ** Examples

## Simulate data from a torus
set.seed(30)
n.torus <- 20
rho <- 0.15
sigma <- 1.5
beta <- c(1, 2)
XX <- cbind(rep(1, n.torus^2), log(1:n.torus^2))
mydata <- CAR.simTorus(n.torus, n.torus, rho, 1/sigma)
y <- XX %*% beta + mydata$X
mydata$data.vec <- data.frame(y=y, XX[,-1])

## evaluate the log-likelihood without lambda
loglik.dCAR(pars = c(0.1, 1, 0.9, 2.1), data = mydata)

## evaluate the log-likelihood with lamda
lambda <- eigen(mydata$W, symmetric = TRUE, only.values=TRUE)$values
mydata$lambda <- lambda
loglik.dCAR(pars = c(0.1, 1, 0.9, 2.1), data = mydata)

## evaluate the profile log-likelihood of rho
ploglik.dCAR(rho = 0.1, data = mydata)

## given rho = 0.1, find the least square estimates for beta and sigma
get.beta.lm(rho = 0.1, data = mydata)
sigmabeta(rho = 0.1, data = mydata)

## find the maximum pseudo-likelihood estimates
mple.dCAR(data = mydata)



