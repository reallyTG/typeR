library(ghyp)


### Name: ghyp-distribution
### Title: The Generalized Hyperbolic Distribution
### Aliases: dghyp pghyp rghyp qghyp
### Keywords: distribution models multivariate datagen

### ** Examples

  ## Univariate generalized hyperbolic distribution
  univariate.ghyp <- ghyp()

  par(mfrow=c(5, 1))

  quantiles <- seq(-4, 4, length = 500)
  plot(quantiles, dghyp(quantiles, univariate.ghyp))
  plot(quantiles, pghyp(quantiles, univariate.ghyp))

  probabilities <- seq(1e-4, 1-1e-4, length = 500)
  plot(probabilities, qghyp(probabilities, univariate.ghyp, method = "splines"))

  hist(rghyp(n=10000,univariate.ghyp),nclass=100)

  ## Mutivariate generalized hyperbolic distribution
  multivariate.ghyp <- ghyp(sigma=var(matrix(rnorm(10),ncol=2)),mu=1:2,gamma=-(2:1))

  par(mfrow=c(2, 1))

  quantiles <- outer(seq(-4, 4, length = 50), c(1, 1))
  plot(quantiles[, 1], dghyp(quantiles, multivariate.ghyp))
  plot(quantiles[, 1], pghyp(quantiles, multivariate.ghyp, n.sim = 1000))

  rghyp(n = 10, multivariate.ghyp)



