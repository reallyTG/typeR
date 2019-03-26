library(stsm)


### Name: mloglik.fd
### Title: Spectral Log-Likelihood Function and Derivatives
### Aliases: mloglik.fd mcloglik.fd mloglik.fd.deriv mcloglik.fd.deriv
###   mloglik.fd.grad mcloglik.fd.grad
### Keywords: ts

### ** Examples

# define the local level model for Nile time series
pars <- c("var1" = 11000, "var2" = 1700)
m <- stsm.model(model = "local-level", y = Nile, pars = pars)
# 'mloglik.fd' returns the negative of the log-likelihood function
mloglik.fd(model = m)
# 'logLik' returns the value of the log-likelihood function
logLik(object = m, domain = "frequency")

# compare analytical and numerical derivatives
# more tests in file 'test-derivatives-mloglik-fd.R' in the 
# folder 'inst' of the source package
system.time(da <- mloglik.fd.deriv(m, gradient = TRUE, hessian = TRUE))
dgn <- numDeriv::grad(func = mloglik.fd, x = m@pars, model = m)
dhn <- numDeriv::hessian(func = mloglik.fd, x = m@pars, model = m)
all.equal(as.vector(da$gradient), dgn)
all.equal(da$hessian, dhn)

# the same as above for the local level plus seasonal model and 
# a sample simulated series
data("llmseas")
m <- stsm.model(model = "llm+seas", y = llmseas)
system.time(a <- mloglik.fd.deriv(model = m, gradient = TRUE, hessian = TRUE))
system.time(g <- numDeriv::grad(func = mloglik.fd, x = m@pars, model = m))
system.time(h <- numDeriv::hessian(func = mloglik.fd, x = m@pars, model = m))
all.equal(a$gradient, g, check.attributes = FALSE)
all.equal(a$hessian, h, check.attributes = FALSE)



