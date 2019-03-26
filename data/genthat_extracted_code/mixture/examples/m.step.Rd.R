library(mixture)


### Name: m.step
### Title: M-Step
### Aliases: m.step
### Keywords: multivariate cluster classif

### ** Examples

data("x2")
u0 = runif(nrow(x2))
m.step(data=x2, covtype="VVV", w=cbind(u0,1-u0), D=NULL, mtol=1e-8, mmax=10)



