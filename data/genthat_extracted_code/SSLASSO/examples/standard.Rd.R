library(SSLASSO)


### Name: standard
### Title: Standardizes a design matrix
### Aliases: standard

### ** Examples

X <- matrix(rnorm(50), 10, 5)
S <- standard(X)
apply(S, 2, sum)
apply(S, 2, function(x) mean(x^2))



