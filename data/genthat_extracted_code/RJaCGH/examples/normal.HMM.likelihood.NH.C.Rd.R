library(RJaCGH)


### Name: normal.HMM.likelihood.NH.C
### Title: Likelihood for non-homogeneous hidden Markov model
### Aliases: normal.HMM.likelihood.NH.C
### Keywords: models

### ** Examples


## create data
y <- c(rnorm(100, 0, 1), rnorm(50, 3, 1), rnorm(20, -3, 1),
rnorm(60, 0, 1))
x <- sample(1:1000, 229, replace=FALSE)
x <- x/max(x)
Chrom <- rep(1:23, rep(10, 23))
## same model for all genome
loglik <- 0
for (i in 1:23) {
loglik <- loglik + normal.HMM.likelihood.NH.C(y=y, x =x, mu=c(-3, 0, 3),
sigma.2=c(1,1,1), beta=matrix(c(0, 1, 1, 1, 0, 1, 1, 1, 0), 3))$loglik
}
loglik



