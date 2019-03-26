library(KFKSDS)


### Name: KF
### Title: Kalman Filter for State Space Models
### Aliases: KF KF.C KF.deriv KF.deriv.C
### Keywords: ts, model

### ** Examples

# local level plus seasonal model with arbitrary parameter values
# for the 'JohnsonJohnson' time series
m <- stsm::stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
ss <- stsm::char2numeric(m)

# run the Kalman filter
kf <- KF(m@y, ss)
plot(kf$a.upd[,1:2], main = "filtered state vector")

# 'KF.C' is a faster version that returns only the 
# value of the negative of the likelihood function
kfc <- KF.C(m@y, ss)
all.equal(kf$mll, kfc)

# compute also derivative terms used below
kfd <- KF.deriv(m@y, ss)
all.equal(kfc, kfd$mll)
kfdc <- KF.deriv.C(m@y, ss, return.all = TRUE)
all.equal(kf$mll, kfdc$mll)

# as expected the versions that use compiled C code
# are faster that the versions written fully in R
# e.g. not including derivatives
## Not run: 
##D system.time(for(i in seq_len(10)) kf <- KF(m@y, ss))
##D system.time(for(i in seq_len(10)) kfc <- KF.C(m@y, ss))
##D # e.g. including derivatives
##D system.time(for(i in seq_len(10)) kfd <- KF.deriv(m@y, ss))
##D system.time(for(i in seq_len(10)) kfdc <- KF.deriv.C(m@y, ss, return.all = TRUE))
## End(Not run)

# compare analytical and numerical derivatives
# they give same results up to a tolerance error
fcn <- function(x, model, type = c("v", "f"))
{
  m <- stsm::set.pars(model, x)
  ss <- stsm::char2numeric(m)
  kf <- KF(m@y, ss)
  switch(type, "v" = sum(kf$v), "f" = sum(kf$f))
}

dv <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "v")
all.equal(dv, colSums(kfd$dv), check.attributes = FALSE)
all.equal(dv, colSums(kfdc$dv), check.attributes = FALSE)
df <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "f")
all.equal(df, colSums(kfd$df), check.attributes = FALSE)
all.equal(df, colSums(kfdc$df), check.attributes = FALSE)

# compare timings in version written in R with numDeriv::grad
# no calls to compiled C code in either case
# looking at these timings, using analytical derivatives is
# expected to be useful in optimization algorithms
## Not run: 
##D system.time(for (i in seq_len(10)) 
##D   numdv <- numDeriv::grad(func = fcn, x = m@pars, model = m, type = "v"))
##D system.time(for(i in seq_len(10)) kfdv <- colSums(KF.deriv(m@y, ss)$dv))
## End(Not run)

# compare timings when convergence is not checked with the case 
# when steady state values are used after convergence is observed
# computation time is reduced substantially
## Not run: 
##D n <- length(m@y)
##D system.time(for(i in seq_len(20)) a <- KF.deriv(m@y, ss, convergence = c(0.001, n)))
##D system.time(for(i in seq_len(20)) b <- KF.deriv(m@y, ss, convergence = c(0.001, 10)))
##D # the results are the same up to a tolerance error
##D all.equal(colSums(a$dv), colSums(b$dv))
## End(Not run)



