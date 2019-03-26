library(cglasso)


### Name: loglik
### Title: Extract Log-Likelihood or Q-Function
### Aliases: loglik print.loglik
### Keywords: models

### ** Examples

library("cglasso")
set.seed(123)

#################
# cglasso model #
#################
p <- 5L
n <- 100L
mu <- rep(0L, p)
Tht <- diag(p)
diag(Tht[-1L, -p]) <- diag(Tht[-p, -1L]) <- 0.3
Sgm <- solve(Tht)
X <- rdatacggm(n = n, mu = mu, Sigma = Sgm, probr = 0.05)
out <- cglasso(X = X)
out_loglik <- loglik(out)
out_loglik

##############
# cggm model #
##############
out_mle <- mle(out)
out_loglik <- loglik(out_mle)
out_loglik

#################
# mglasso model #
#################
library(MASS)
X <- mvrnorm(n = n, mu = mu, Sigma = Sgm)
id.na <- sample.int(n = n * p, size = n * p * 0.05)
X[id.na] <- NA
out <- mglasso(X = X)
out_loglik <- loglik(out)
out_loglik

##############
# mggm model #
##############
out_mle <- mle(out)
out_loglik <- loglik(out_mle)
out_loglik

################
# glasso model #
#################
X <- mvrnorm(n = n, mu = mu, Sigma = Sgm)
out <- glasso(X)
out_loglik <- loglik(out)
out_loglik

#############
# ggm model #
#############
out_mle <- mle(out)
out_loglik <- loglik(out_mle)
out_loglik



