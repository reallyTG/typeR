library(KFKSDS)


### Name: DS
### Title: Disturbance Smoother for State Space Models
### Aliases: DS DS.deriv
### Keywords: ts, model

### ** Examples

# local level plus seasonal model with arbitrary parameter values
# for the 'JohnsonJohnson' time series
m <- stsm::stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
ss <- stsm::char2numeric(m)

kf <- KF(m@y, ss)
ks <- KS(m@y, ss, kf)
ds <- DS(m@y, ss, kf, ks)
acf(ds$epshat, main = "ACF of smoothed disturbance")

kfd <- KF.deriv(m@y, ss)
ksd <- KS.deriv(m@y, ss, kfd)
dsd <- DS.deriv(ss, ksd)

# compare analytical and numerical derivatives
fcn <- function(x, model, type, i = 1)
{
  m <- stsm::set.pars(model, x)
  ss <- stsm::char2numeric(m)
  kf <- KF(m@y, ss)
  ks <- KS(m@y, ss, kf)
  ds <- DS(m@y, ss, kf, ks)
  
  switch(type,
    "epshat" = sum(ds$epshat),
    "vareps" = sum(ds$vareps))
}

d <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "epshat")
all.equal(d, dsd$depshat)

d <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "vareps")
all.equal(d, dsd$dvareps)



