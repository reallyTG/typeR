library(pgam)


### Name: plot.pgam
### Title: Plot of estimated curves
### Aliases: plot.pgam
### Keywords: ts smooth regression

### ** Examples

library(pgam)
data(aihrio)
attach(aihrio)
form <- ITRESP5~f(WEEK)+HOLIDAYS+rain+PM+g(tmpmax,7)+g(wet,3)
m <- pgam(form,aihrio,omega=.8,beta=.01,maxit=1e2,eps=1e-4,optim.method="BFGS")

plot(m,at.once=TRUE)




