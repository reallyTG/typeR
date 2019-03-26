library(EXRQ)


### Name: ThreeStage
### Title: Three-Stage Extreme Conditional Quantile Estimator
### Aliases: ThreeStage

### ** Examples

#A simulation example (sqrt transformation, heteroscedastic error)
library(EXRQ)
n=500
tau.e = c(0.99, 0.993, 0.995)
set.seed(12368819)
x1 = runif(n, -1, 1)
x2 = runif(n, -1, 1)
sqrty = 2 + x1 + x2 + (1+0.8*x1)*rpareto(n, 0.5)
x = as.matrix(cbind(x1, x2))
y = sqrty^2
xstar = rbind(c(-0.5,0),c(0,-0.5),c(0,0),c(0.5,0),c(0,0.5))
## 3Stage estimator
out.3stage <- ThreeStage(y, x, xstar, tau.e, grid.lam=seq(-0.5, 1.5, 0.1), grid.k=50, tau.lam=0.9)



