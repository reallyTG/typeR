library(KFKSDS)


### Name: KS
### Title: Kalman Smoother for State Space Models
### Aliases: KS KS.deriv
### Keywords: ts, model

### ** Examples

# local level plus seasonal model with arbitrary parameter values
# for the 'JohnsonJohnson' time series
m <- stsm::stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
ss <- stsm::char2numeric(m)

kf <- KF(m@y, ss)
ks <- KS(m@y, ss, kf)

plot(ks$ahat[,1:2], main = "smoothed state vector")

kfd <- KF.deriv(m@y, ss)
ksd <- KS.deriv(m@y, ss, kfd)
all.equal(ks$ahat, ksd$ahat)

# extended output is required if 'KF.deriv.C' is used to obtain 
# the necessary elements from the filter, set return.all = TRUE
kfdc <- KF.deriv.C(m@y, ss, return.all = TRUE)
ksd <- KS.deriv(m@y, ss, kfdc)
all.equal(ks$ahat, ksd$ahat)

# compare analytical and numerical derivatives
# yield same results up to a tolerance error
fcn <- function(x, model, type, i)
{
  m <- stsm::set.pars(model, x)
  ss <- stsm::char2numeric(m)
  kf <- KF(m@y, ss)
  ks <- KS(m@y, ss, kf)
  switch(type, "ahat" = sum(ks$ahat[,i]), "r" = sum(ks$r[,i]))
}

dahat <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "ahat", i = 1)
all.equal(dahat, colSums(ksd$dahat[,1,]))
dahat <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "ahat", i = 2)
all.equal(dahat, colSums(ksd$dahat[,2,]))
dahat <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "ahat", i = 3)
all.equal(dahat, colSums(ksd$dahat[,3,]))
dr <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "r", i = 1)
all.equal(dr, colSums(ksd$dr[,1,]), check.attributes = FALSE)
dr <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "r", i = 2)
all.equal(dr, colSums(ksd$dr[,2,]), check.attributes = FALSE)
dr <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "r", i = 3)
all.equal(dr, colSums(ksd$dr[,3,]), check.attributes = FALSE)



