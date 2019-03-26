library(mixture)


### Name: e.step
### Title: E-Step
### Aliases: e.step
### Keywords: multivariate cluster classif

### ** Examples

data("x2")
u0 = runif(nrow(x2))
m0 = m.step(data=x2, covtype="VVV", w=cbind(u0,1-u0), D=NULL, mtol=1e-8, mmax=10)
w0 = e.step(data=x2, gpar=m0, labels=NULL, v=1)



