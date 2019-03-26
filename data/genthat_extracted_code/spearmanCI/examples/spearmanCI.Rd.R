library(spearmanCI)


### Name: spearmanCI
### Title: Jackknife Euclidean / Empirical Likelihood Inference for
###   Spearman's Correlation
### Aliases: spearmanCI spearmanCI.default
### Keywords: spearman

### ** Examples

## Real data example
data(fire)
attach(fire)
spearmanCI(building, contents)

## The intervals in de Carvalho and Marques (2012, Section 3.2)
## differ slightly as they are based on the estimate 
## spearman <- function(x, y) {
##  n <- length(x)
##  F <- ecdf(x); G <- ecdf(y)
##  return(12 / n * sum((F(x) - 1 / 2) * (G(y) - 1 / 2)))  
## }

## Simulated data example
library(MASS)
pearson <- .7
Sigma <- matrix(c(1, pearson, pearson, 1), 2, 2)
xy <- mvrnorm(n = 1000, rep(0, 2), Sigma)
spearmanCI(xy[, 1], xy[, 2])
abline(v = 6 / pi * asin(pearson / 2), col = "grey", lty = 3)



