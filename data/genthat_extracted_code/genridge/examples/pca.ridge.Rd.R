library(genridge)


### Name: pca.ridge
### Title: Transform Ridge Estimates to PCA Space
### Aliases: pca.ridge
### Keywords: dplot multivariate

### ** Examples

longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)

plridge <- pca.ridge(lridge)
traceplot(plridge)
pairs(plridge)
# view in space of smallest singular values
plot(plridge, variables=5:6)




