library(mpath)


### Name: nclreg
### Title: fit a nonconvex loss based robust linear model with lasso (or
###   elastic net), snet or mnet regularization
### Aliases: nclreg nclreg.formula nclreg.matrix nclreg.default
### Keywords: models regression

### ** Examples

#binomial
x=matrix(rnorm(100*20),100,20)
g2=sample(c(-1,1),100,replace=TRUE)
fit=nclreg(x,g2,s=1,rfamily="closs")



