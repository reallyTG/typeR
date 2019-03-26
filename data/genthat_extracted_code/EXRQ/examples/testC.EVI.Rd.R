library(EXRQ)


### Name: testC.EVI
### Title: Testing the Constancy of EVI Over Covariates
### Aliases: testC.EVI

### ** Examples

library(EXRQ)
n=500
tau.e = c(0.99, 0.993, 0.995)
set.seed(12368819)
x1 = runif(n, -1, 1)
x2 = runif(n, -1, 1)
sqrty = 2 + x1 + x2 + (1+0.8*x1)*rpareto(n, 0.5)
x = as.matrix(cbind(x1, x2))
y = sqrty^2
out = testC.EVI(y, x, grid.lam=seq(-0.5, 1.5, 0.1), grid.k=50, tau.lam=0.9)
(Tval = out$scaledTm)
(pval.iid = out$pval.iid)
(pval.nid = out$pval.nid)



