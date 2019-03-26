library(KFKSDS)


### Name: KFKSDS
### Title: Kalman Filter, Smoother and Disturbance Smoother
### Aliases: KSDS KSDS.deriv KFKSDS.deriv.C KFKSDS.deriv.steady.C
### Keywords: ts, model

### ** Examples

# See tests comparing the analytical derivatives returned by
# these functions and the numerical derivatives evaluated with
# function 'numDeriv::grad' in the folder 'KFKSDS/inst/tests'
# of the source package

# local level plus seasonal model with arbitrary parameter values
# for the 'JohnsonJohnson' time series
m <- stsm::stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
ss <- stsm::char2numeric(m)
kfd <- KF.deriv(m@y, ss)
ksds <- KSDS(m@y, ss, kfd)
da <- KSDS.deriv(m@y, ss, kfd)
db <- KFKSDS.deriv.C(m@y, ss)
# the ouput is the same but is returned with a different arrangement
dim(da$dahat)
dim(db$dahat)
for (i in seq_along(m@y))
  stopifnot(all.equal(da$dahat[i,,], db$dahat[,,i]))
dim(da$dN)
dim(db$dN)
for (i in seq_along(m@y))
  for (j in seq_len(3))
    stopifnot(all.equal(diag(da$dN[i,,,j]), db$dN[,j,i], check.attributes = FALSE))



