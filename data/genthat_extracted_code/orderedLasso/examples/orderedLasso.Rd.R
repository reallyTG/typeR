library(orderedLasso)


### Name: orderedLasso
### Title: Fit an ordered lasso
### Aliases: orderedLasso

### ** Examples

set.seed(3)
n = 50
b = c(7,3,1,0)
p = length(b)
x = matrix(rnorm(n*p),nrow = n)
sigma = 4
y = x %*% b + sigma * rnorm(n, 0, 1)
result1 = orderedLasso(x,y, lambda = 1, intercept =TRUE, standardize = TRUE,
          method = "GG", strongly.ordered = TRUE)
result2 = orderedLasso(x,y, lambda = 1, intercept = TRUE, standardize =TRUE,
          strongly.ordered = TRUE)
print(result1)
print(result2)



