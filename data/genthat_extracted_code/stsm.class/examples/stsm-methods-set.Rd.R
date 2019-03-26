library(stsm.class)


### Name: stsm-set-methods
### Title: Setter Methods for Class 'stsm'
### Aliases: stsm-set-methods set.cpar set.cpar,stsm-method set.nopars
###   set.nopars,stsm-method set.pars set.pars,stsm-method set.sgfc
###   set.sgfc,stsm-method set.xreg set.xreg,stsm-method
### Keywords: methods

### ** Examples

# sample models with arbitrary parameter values
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
get.pars(m)

# correct modification
m1 <- set.pars(m, c(1, 2, 3))
get.pars(m1)
m1 <- set.pars(m, c(var1 = 11))
get.pars(m1)

# correct but error prone
m1@pars[] <- c(4, 22, 33)
get.pars(m1)
m1@pars <- c(var1 = 1, var2 = 2, var3 = 3)
get.pars(m1)

# inconsistent assignment (error returned)
# 'var4' is not a parameter of model 'llm+seas'
try(m1 <- set.pars(m, c(var4 = 4)))
# inconsistent assignment (no error returned)
# the error is not noticed at this point
# unless 'validObject' is called
m1 <- m
m1@pars["var4"] <- 4
get.pars(m1)
try(validObject(m1))

# modify only one element
m1 <- set.pars(m, v=c(var1=22))
get.pars(m1)
# wrong assignment, the whole vector in the slot is overwritten 
# no error returned at the time of doing the assignment
m1@pars <- c(var1 = 1)
get.pars(m1)
try(validObject(m1))

# consistent assignment but maybe not really intended
# all the elements are set equal to 12
m1 <- m
m1@pars[] <- 12
get.pars(m1)
# warning returned by 'set.pars'
m2 <- set.pars(m, 12)
get.pars(m2)

# wrong value unnoticed (negative variance)
m1 <- m
m1@pars[] <- c(-11, 22, 33)
get.pars(m1)
# negative sign detected by 'set.pars'
try(m1 <- set.pars(m, c(-11, 22, 33)))

# inplace = FALSE
# the whole object 'm' is assigned to a new object, 
# which will probably involve making a copy of all the slots
m <- set.pars(m, c(1,2,3), inplace = FALSE)
get.pars(m)

# inplace = TRUE
# the output is not assigned to a new object 
# the only operation is the modification of the slot 'pars'
# no apparent additional internal operations such as copying unmodified slots
get.pars(m)
set.pars(m, c(11,22,33), inplace = TRUE)
get.pars(m)

# set a matrix of regressors
xreg <- cbind(xreg1 = seq_len(84), xreg2 = c(rep(0, 40), rep(1, 44)))
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, xreg = xreg)
m
# set a new matrix of regressors to an existing
xreg3 <- seq(length(m@y))
m2 <- set.xreg(m, xreg3)
m2
# remove the external regressors
m3 <- set.xreg(m, NULL)
m3
m3@xreg
# initialize the coefficients to some values
m <- stsm.class::stsm.model(model = "llm+seas", y = JohnsonJohnson,
  pars = c("xreg1" = 10), xreg = xreg)
m
m <- stsm.class::stsm.model(model = "llm+seas", y = JohnsonJohnson,
  pars = c("xreg2" = 20, "xreg1" = 10), xreg = xreg)
m



