library(robustX)


### Name: covNNC
### Title: Robust Covariance Estimation via Nearest Neighbor Cleaning
### Aliases: covNNC cov.nnve
### Keywords: multivariate robust

### ** Examples

data(iris)
covNNC(iris[-5])

data(hbk, package="robustbase")
hbk.x <- data.matrix(hbk[, 1:3])
covNNC(hbk.x)



