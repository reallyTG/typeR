library(MultiFit)


### Name: multiSummary
### Title: Summary of significant tests
### Aliases: multiSummary

### ** Examples

set.seed(1)
n = 300
d1 = d2 = 2
x = matrix(0, nrow=n, ncol=d1)
y = matrix(0, nrow=n, ncol=d2)
x[,1] = rnorm(n)
x[,2] = runif(n)
y[,1] = rnorm(n)
y[,2] = sin(5*pi*x[,2]) + 1/5*rnorm(n)
fit = multiFit(x=x, y=y, verbose=TRUE)
w = multiSummary(x=x, y=y, fit=fit, alpha=0.0001)



