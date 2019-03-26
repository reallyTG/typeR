library(SimCorMultRes)


### Name: rmult.crm
### Title: Simulating Correlated Ordinal Responses Conditional on a
###   Marginal Continuation-Ratio Model Specification
### Aliases: rmult.crm

### ** Examples

## See Example 3.3 in the Vignette.
set.seed(1)
N <- 500
clsize <- 4
intercepts <- c(-1.5, -0.5, 0.5, 1.5)
betas <- 1
x <- rnorm(N * clsize)
ncategories <- 5
cor.matrix <- diag(1, (ncategories - 1) * clsize) + kronecker(toeplitz(c(0,
    rep(0.24, ncategories - 2))), matrix(1, clsize, clsize))
CorOrdRes <- rmult.crm(clsize = clsize, intercepts = intercepts, betas = betas,
    xformula = ~x, cor.matrix = cor.matrix, link = 'probit')
head(CorOrdRes$Ysim)




