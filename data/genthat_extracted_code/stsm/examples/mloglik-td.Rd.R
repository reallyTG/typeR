library(stsm)


### Name: mloglik.td
### Title: Time Domain Log-Likelihood Function and Derivatives
### Aliases: mloglik.td KFconvar mloglik.td.deriv mloglik.td.grad
### Keywords: ts

### ** Examples

# local level plus seasonal model for a sample simulated series
data("llmseas")
m <- stsm.model(model = "llm+seas", y = llmseas,
  pars = c("var1" = 300, "var2" = 10, "var3" = 100))
# evaluate the time domain likelihood function using 
# excluding the contributions of the first 8 observations
mloglik.td(model = m, KF.version = "KFKSDS", KF.args = list(t0 = 9))

# compare analytical and numerical derivatives
# identical gradient up to a tolerance
a <- mloglik.td.deriv(m, infomat = TRUE)
g <- numDeriv::grad(func = mloglik.td, x = m@pars, 
  model = m, KF.version = "KFKSDS")
h <- numDeriv::hessian(func = mloglik.td, x = m@pars, 
  model = m, KF.version = "KFKSDS")
all.equal(a$gradient, g, check.attributes = FALSE)



