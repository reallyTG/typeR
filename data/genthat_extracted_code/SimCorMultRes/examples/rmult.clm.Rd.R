library(SimCorMultRes)


### Name: rmult.clm
### Title: Simulating Correlated Ordinal Responses Conditional on a
###   Marginal Cumulative Link Model Specification
### Aliases: rmult.clm

### ** Examples

## See Example 3.2 in the Vignette.
set.seed(12345)
N <- 500
clsize <- 4
intercepts <- c(-1.5, -0.5, 0.5, 1.5)
betas <- matrix(c(1, 2, 3, 4), 4, 1)
x <- rep(rnorm(N), each = clsize)
cor.matrix <- toeplitz(c(1, 0.85, 0.5, 0.15))
CorOrdRes <- rmult.clm(clsize = clsize, intercepts = intercepts, betas = betas,
    xformula = ~x, cor.matrix = cor.matrix, link = 'probit')
head(CorOrdRes$simdata, n = 8)

## Same sampling scheme except that the parameter vector is now time-stationary.
set.seed(12345)
x <- rep(rnorm(N), each = clsize)
CorOrdRes <- rmult.clm(clsize = clsize, betas = 1, xformula = ~x, cor.matrix = toeplitz(c(1,
    0.85, 0.5, 0.15)), intercepts = c(-1.5, -0.5, 0.5, 1.5), link = 'probit')
## Fit a GEE model (Touloumis et al., 2013) to estimate the regression
## coefficients.
library(multgee)
fitmod <- ordLORgee(y ~ x, id = id, repeated = time, link = 'probit', data = CorOrdRes$simdata)
coef(fitmod)




