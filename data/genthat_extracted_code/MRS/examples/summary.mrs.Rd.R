library(MRS)


### Name: summary.mrs
### Title: Summary of a mrs object
### Aliases: summary.mrs

### ** Examples

set.seed(1)
n = 100
p = 2
X = matrix(c(runif(p*n/2),rbeta(p*n/2, 1, 4)), nrow=n, byrow=TRUE)
G = c(rep(1,n/2), rep(2,n/2))
object = mrs(X=X, G=G)
fit = summary(object, rho = 0.5, abs_eff = 0.1)



