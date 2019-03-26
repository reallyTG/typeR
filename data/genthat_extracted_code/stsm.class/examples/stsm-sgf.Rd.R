library(stsm.class)


### Name: stsm.sgf
### Title: Spectral Generating Function of Common Structural Time Series
###   Models
### Aliases: stsm.sgf
### Keywords: ts

### ** Examples

# spectral generating function of the local level plus seasonal model
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15), nopars = c("var3" = 30))
res <- stsm.sgf(m)
res$sgf
plot(res$sgf)
res$constants
# the element 'constants' contains the constant variables
# related to each component regardless of whether the 
# variances related to them are in the slot 'pars' or 'nopars'
names(get.pars(m))
colnames(res$constants)

# compare analytical and numerical derivatives
# identical values
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
res <- stsm.sgf(m, gradient = TRUE)

fcn <- function(x, model = m) {
  m <- set.pars(model, x)
  res <- stsm.sgf(m)
  sum(res$sgf)
}

a1 <- numDeriv::grad(func = fcn, x = get.pars(m))
a2 <- colSums(res$grad)
all.equal(a1, a2, check.attributes = FALSE)

# analytical derivatives are evaluated faster than numerically
system.time(a1 <- numDeriv::grad(func = fcn, x = get.pars(m)))
system.time(a2 <- colSums(stsm.sgf(m, gradient = TRUE)$grad))



