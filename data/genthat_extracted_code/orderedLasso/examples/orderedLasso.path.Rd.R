library(orderedLasso)


### Name: orderedLasso.path
### Title: Fit a path of ordered lasso models
### Aliases: orderedLasso.path

### ** Examples

set.seed(3)
n = 50
b = c(4,3,1,0)
p = length(b)
x = matrix(rnorm(n*p),nrow = n)
sigma = 5
y = x %*% b + sigma * rnorm(n, 0, 1)
path1 = orderedLasso.path(x,y, intercept =  FALSE, 
        method = "Solve.QP", strongly.ordered = TRUE)
plot(path1)
print(path1)



