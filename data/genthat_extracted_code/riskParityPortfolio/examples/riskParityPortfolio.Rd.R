library(riskParityPortfolio)


### Name: riskParityPortfolio
### Title: Design of Risk Parity Portfolios
### Aliases: riskParityPortfolio

### ** Examples

library(riskParityPortfolio)

# create covariance matrix
N <- 5
V <- matrix(rnorm(N^2), ncol = N)
Sigma <- cov(V)

# risk parity portfolio
res <- riskParityPortfolio(Sigma)
names(res)
#> [1] "w"                 "risk_contribution"
res$w
#> [1] 0.04142886 0.38873465 0.34916787 0.09124019 0.12942842
res$risk_contribution
#> [1] 0.007361995 0.007361995 0.007361995 0.007361995 0.007361995
c(res$w * (Sigma %*% res$w))
#> [1] 0.007361995 0.007361995 0.007361995 0.007361995 0.007361995

# risk budggeting portfolio
res <- riskParityPortfolio(Sigma, b = c(0.4, 0.4, 0.1, 0.05, 0.05))
res$risk_contribution/sum(res$risk_contribution)
#> [1] 0.40 0.40 0.10 0.05 0.05




