library(ncvreg)


### Name: std
### Title: Standardizes a design matrix
### Aliases: std

### ** Examples

X <- matrix(rnorm(50), 10, 5)
S <- std(X)
apply(S, 2, sum)
apply(S, 2, function(x) mean(x^2))



