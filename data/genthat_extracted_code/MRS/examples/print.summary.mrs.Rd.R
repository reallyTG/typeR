library(MRS)


### Name: print.summary.mrs
### Title: Print summary of a mrs object
### Aliases: print.summary.mrs

### ** Examples

set.seed(1)
n = 100
p = 2
X = matrix(c(runif(p*n/2),rbeta(p*n/2, 1, 4)), nrow=n, byrow=TRUE)
G = c(rep(1,n/2), rep(2,n/2))
x = mrs(X=X, G=G)
fit = summary(x, rho = 0.95, abs_eff = 1)
print(fit)



