library(stsm.class)


### Name: stsm-get-methods
### Title: Getter Methods for Class 'stsm'
### Aliases: stsm-get-methods get.cpar get.cpar,stsm-method get.nopars
###   get.nopars,stsm-method get.pars get.pars,stsm-method
### Keywords: methods

### ** Examples

# sample models with arbitrary parameter values

# model in standard parameterization
# internal parameter values are the same as the model parameter
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
m@pars
get.pars(m)

# model parameterized, the variances are the square
# of an auxiliar vector of parameters
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30), transPars = "square")
# auxiliar vector of parameters
m@pars
# parameters of the model, variances
get.pars(m)

# model rescaled, variances are relative to 'var1'
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var2" = 15, "var3" = 30), cpar = c("var1" = 2))
# internal values
m@pars
m@cpar
# relative variances
get.pars(m)
get.cpar(m)
# absolute variances
get.pars(m, rescale = TRUE)
get.cpar(m, rescale = TRUE)

# model defined in terms of relative variances 
# and with the parameterization \code{transPars="square};
# the transformation is applied to the relative variances,
# the relative variances are first transformed and afterwards 
# they are rescaled back to absolute variances if requested
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var2" = 3, "var3" = 6), cpar = c("var1" = 2),
  transPars = "square")
c(get.cpar(m, rescale = FALSE), get.pars(m, rescale = FALSE))
c(get.cpar(m, rescale = TRUE), get.pars(m, rescale = TRUE))

# when 'cpar' is defined, 'nopars' is also interpreted as a relative variance
# and therefore it is rescaled if absolute variances are requested
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var2" = 3), cpar = c("var1" = 2), nopars = c("var3" = 6),
  transPars = NULL)
v <- c(get.cpar(m, rescale = FALSE), get.pars(m, rescale = FALSE), get.nopars(m, rescale = FALSE))
v[c("var1", "var2", "var3")]
v <- c(get.cpar(m, rescale = TRUE), get.pars(m, rescale = TRUE), get.nopars(m, rescale = TRUE))
v[c("var1", "var2", "var3")]

# 'nopars' is rescaled as shown in the previous example
# but it is not affected by the parameterization chosen for 'pars'
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var2" = 3), cpar = c("var1" = 2), nopars = c("var3" = 6),
  transPars = "square")
v <- c(get.cpar(m, rescale = FALSE), get.pars(m, rescale = FALSE), get.nopars(m, rescale = FALSE))
v[c("var1", "var2", "var3")]
v <- c(get.cpar(m, rescale = TRUE), get.pars(m, rescale = TRUE), get.nopars(m, rescale = TRUE))
v[c("var1", "var2", "var3")]



