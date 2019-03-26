library(surveillance)


### Name: scores
### Title: Proper Scoring Rules for Poisson or Negative Binomial
###   Predictions
### Aliases: scores scores.default logs rps dss ses
### Keywords: univar

### ** Examples

mu <- c(0.1, 1, 3, 6, pi, 100)
size <- 0.1
set.seed(1)
y <- rnbinom(length(mu), mu = mu, size = size)
scores(y, mu = mu, size = size)
scores(y, mu = mu, size = 1)  # ses ignores the variance
scores(y, mu = 1, size = size)

## apply a specific scoring rule
scores(y, mu = mu, size = size, which = "rps")
rps(y, mu = mu, size = size)



