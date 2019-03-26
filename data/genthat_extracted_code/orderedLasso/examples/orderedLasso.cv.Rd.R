library(orderedLasso)


### Name: orderedLasso.cv
### Title: Cross-validation function for the ordered lasso
### Aliases: orderedLasso.cv

### ** Examples

set.seed(3)
n = 50
b = c(4,3,1,0)
p = length(b)
x = matrix(rnorm(n*p),nrow = n)
sigma = 5
y = x %*% b + sigma * rnorm(n, 0, 1)
cvmodel = orderedLasso.cv(x,y, intercept = FALSE, trace = TRUE, 
          method = "Solve.QP", strongly.ordered = TRUE)
print(cvmodel)
plot(cvmodel)



