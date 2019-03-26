library(MfUSampler)


### Name: MfU.Sample
### Title: Drawing MCMC Samples from a Multivariate Distribution Using a
###   Univariate Sampler
### Aliases: MfU.Sample MfU.Sample.Run MfUSampler

### ** Examples


z <- c(1, 4, 7, 10, 13, 16, 19, 24)
m1.prior <- c(17, 26, 39, 27, 35, 37, 26, 23)
m2.prior <- c(215, 218, 137, 62, 36, 16, 13, 15)
m1.current <- c(46, 52, 44, 54, 38, 39, 23, 52)
m2.current <- c(290, 211, 134, 91, 53, 42, 23, 32)

m1.total <- m1.prior + m1.current
m2.total <- m2.prior + m2.current

logpost.retin <- function(beta, z, m1, m2
  , beta0 = rep(0.0, 3), W = diag(1e+6, nrow = 3)) {
  X <- cbind(1, z, z^2)
  
  beta <- as.numeric(beta)
  Xbeta <- X %*% beta
  log.prior <- -0.5 * t(beta - beta0) %*% solve(W) %*% (beta - beta0)
  log.like <- -sum((m1 + m2) * log(1 + exp(-Xbeta)) + m2 * Xbeta)
  log.post <- log.prior + log.like

  return (log.post)
}

nsmp <- 1000
beta.ini <- c(0.0, 0.0, 0.0)
beta.smp <- MfU.Sample.Run(beta.ini, logpost.retin, nsmp = nsmp
  , z = z, m1 = m1.total, m2 = m2.total)
summary(beta.smp)




