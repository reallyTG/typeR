library(mederrRank)


### Name: mederrData-class
### Title: Class "mederrData". Data Specification for Identifying the Most
###   Harmful MEdication Errors using a Bayesian Hierarchical Model.
### Aliases: mederrData-class mederrData initialize,mederrData-method
### Keywords: classes methods

### ** Examples

ng <- 50
i <- rep(1:ng, ng)
j <- rep(1:ng, each = ng)
N <- rpois(ng^2, 3 + .05*i - .01*j) + 1

theta_i <- rgamma(ng, 5, 5) - 4/5
delta_j <- rnorm(ng, 0, .2)
logit <- -3 + theta_i[i] + delta_j[j]
y <- rbinom(ng^2, N, exp(logit)/(1 + exp(logit)))

simdata <- new("mederrData", data = cbind(y, N, i, j))



