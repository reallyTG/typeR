library(radir)


### Name: ci.dose.radir
### Title: Credible intervals for radiation dose
### Aliases: ci.dose.radir
### Keywords: radir

### ** Examples

### Example 3 (a)
f <- expression(b1*x+b2*x^2)
pars <- c("b1","b2")
beta <- c(3.126e-3, 2.537e-2)
cov  <- matrix(c(7.205e-06,-3.438e-06,-3.438e-06,2.718e-06),nrow=2)

### (a)
ex1.a <- dose.distr(f, pars, beta, cov, cells=1811, dics=102, 
m.prior="normal", d.prior="uniform", prior.param=c(0, Inf))

ci.dose.radir(ex1.a, 0.90)



