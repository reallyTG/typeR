library(pdSpecEst)


### Name: pdDepth
### Title: Data depth for HPD matrices
### Aliases: pdDepth

### ** Examples

## Pointwise depth
X1 <- replicate(50, Expm(diag(2), H.coeff(rnorm(4), inverse = TRUE)))
pdDepth(y = diag(2), X = X1) ## depth of one point
pdDepth(X = X1) ## depth of each point in the data cloud

## Integrated depth
X2 <- replicate(50, replicate(5, Expm(diag(2), H.coeff(rnorm(4), inverse = TRUE))))
pdDepth(y = replicate(5, diag(2)), X2, method = "zonoid", metric = "logEuclidean")
pdDepth(X = X2, method = "zonoid", metric = "logEuclidean")




