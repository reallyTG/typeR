library(ccaPP)


### Name: corFunctions
### Title: Fast implementations of (robust) correlation estimators
### Aliases: corFunctions corKendall corM corPearson corQuadrant
###   corSpearman
### Keywords: multivariate robust

### ** Examples

## generate data
library("mvtnorm")
set.seed(1234)  # for reproducibility
sigma <- matrix(c(1, 0.6, 0.6, 1), 2, 2)
xy <- rmvnorm(100, sigma=sigma)
x <- xy[, 1]
y <- xy[, 2]

## compute correlations

# Pearson correlation
corPearson(x, y)

# Spearman correlation
corSpearman(x, y)
corSpearman(x, y, consistent=TRUE)

# Kendall correlation
corKendall(x, y)
corKendall(x, y, consistent=TRUE)

# quadrant correlation
corQuadrant(x, y)
corQuadrant(x, y, consistent=TRUE)

# Huber M-estimator
corM(x, y)



