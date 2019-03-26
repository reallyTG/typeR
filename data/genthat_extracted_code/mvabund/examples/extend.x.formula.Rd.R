library(mvabund)


### Name: extend.x.formula
### Title: Extend a Formula to all of it's Terms
### Aliases: extend.x.formula
### Keywords: models

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

foo <- mvformula(spiddat~ X[,1]*X[,2]+log(X[,3]))
extend.x.formula(foo)



