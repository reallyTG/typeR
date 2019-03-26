library(kernDeepStackNet)


### Name: robustStandard
### Title: Robust standardization
### Aliases: robustStandard
### Keywords: models & regression

### ** Examples

# Generate data matrix
set.seed(150)
X <- matrix(rnorm(100*3), ncol=3)

# Robust standardization
scaledX <- robustStandard(X=X)

# Median equals 0
all.equal(sapply(1:3, function(x) median(scaledX[,x])), rep(0, 3))

# MAD equals 1
all.equal(sapply(1:3, function(x) mad(scaledX[,x], constant=1)), rep(1, 3))



