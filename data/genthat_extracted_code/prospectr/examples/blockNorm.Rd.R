library(prospectr)


### Name: blockNorm
### Title: Sum of squares block weighting
### Aliases: blockNorm

### ** Examples

X <- matrix(rnorm(100),ncol=10)
# Block normalize to sum of square = 1
res <- blockNorm(X,1)
sum(res$Xscaled^2) # check



