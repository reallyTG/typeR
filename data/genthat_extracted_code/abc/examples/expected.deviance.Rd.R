library(abc)


### Name: expected.deviance
### Title: Expected deviance
### Aliases: expected.deviance
### Keywords: htest models

### ** Examples

## Function definitions
skewness <- function(x) {
sk <- mean((x-mean(x))^3)/(sd(x)^3)
return(sk)
}
kurtosis <- function(x) {  
k <- mean((x-mean(x))^4)/(sd(x)^4) - 3  
return(k)
}

## Observed summary statistics
obs.sumstat <- c(2.004821, 3.110915, -0.7831861, 0.1440266) 

## Model 1 (Gaussian)
## ##################
## Simulate data
theta <- rnorm(10000, 2, 10)
zeta <- 1/rexp(10000, 1)
param <- cbind(theta, zeta)
y <- matrix(rnorm(200000, rep(theta, each = 20), sd = rep(sqrt(zeta),
each = 20)), nrow = 20, ncol = 10000)

## Calculate summary statistics
s <- cbind(apply(y, 2, mean), apply(y, 2, sd), apply(y, 2, skewness),
apply(y, 2, kurtosis))

## ABC inference
gaus <- abc(target=obs.sumstat, param = param, sumstat=s, tol=.1, hcorr =
FALSE, method = "loclinear")
param.post <- gaus$adj.values

## Posterior predictive simulations
postpred.gaus <- matrix(rnorm(20000, rep(param.post[,1], each = 20), sd
= rep(sqrt(param.post[,2]), each = 20)), nrow = 20, ncol = 1000)
statpost.gaus <- cbind(apply(postpred.gaus, 2,
mean),apply(postpred.gaus, 2, sd),apply(postpred.gaus,
2,skewness),apply(postpred.gaus, 2,kurtosis))

# Computation of the expected deviance
expected.deviance(obs.sumstat, statpost.gaus)$expected.deviance
expected.deviance(obs.sumstat, statpost.gaus, kernel =
"epanechnikov")$expected.deviance

## Modele 2 (Laplace)
## ##################
## Simulate data
zeta <- rexp(10000)
param <- cbind(theta, zeta)
y <- matrix(theta + sample(c(-1,1),200000, replace = TRUE)*rexp(200000,
rep(zeta, each = 20)), nrow = 20, ncol = 10000)

## Calculate summary statistics
s <- cbind( apply(y, 2, mean), apply(y, 2, sd), apply(y, 2, skewness),
apply(y, 2, kurtosis))

## ABC inference
lapl <- abc(target=obs.sumstat, param = param, sumstat=s, tol=.1, hcorr =
FALSE, method = "loclinear")
param.post <- lapl$adj.values

## Posterior predictive simulations
postpred.lapl <- matrix(param.post[,1] + sample(c(-1,1),20000, replace =
TRUE)*rexp(20000, rep(param.post[,2], each = 20)), nrow = 20, ncol =
1000)
statpost.lapl <- cbind(apply(postpred.lapl, 2,
mean),apply(postpred.lapl, 2, sd),apply(postpred.lapl,
2,skewness),apply(postpred.lapl, 2,kurtosis))

## Computation of the expected deviance
expected.deviance(obs.sumstat, statpost.lapl)$expected.deviance
expected.deviance(obs.sumstat, statpost.lapl, kernel =
"epanechnikov")$expected.deviance




