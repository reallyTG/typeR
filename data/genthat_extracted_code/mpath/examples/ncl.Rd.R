library(mpath)


### Name: ncl
### Title: fit a nonconvex loss based robust linear model
### Aliases: ncl ncl.formula ncl.matrix ncl.default
### Keywords: models regression

### ** Examples

#binomial
x=matrix(rnorm(100*20),100,20)
g2=sample(c(-1,1),100,replace=TRUE)
fit=ncl(x,g2,s=1,rfamily="closs")



