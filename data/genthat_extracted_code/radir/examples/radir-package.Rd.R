library(radir)


### Name: radir-package
### Title: Inverse regression model for radiation biodosimetry
### Aliases: radir-package radir
### Keywords: package

### ** Examples

f <- expression(b1*x+b2*x^2)
pars <- c("b1","b2")
beta <- c(3.126e-3, 2.537e-2)
cov  <- matrix(c(7.205e-06,-3.438e-06,-3.438e-06,2.718e-06),nrow=2)

ex1.a <- dose.distr(f, pars, beta, cov, cells=1811, dics=102, 
m.prior="normal", d.prior="uniform", prior.param=c(0, Inf))
summary(ex1.a)
plot(ex1.a)



