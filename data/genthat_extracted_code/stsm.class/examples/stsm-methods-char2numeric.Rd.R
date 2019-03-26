library(stsm.class)


### Name: stsm-char2numeric-methods
### Title: State Space Representation of Objects of Class 'stsm'
### Aliases: char2numeric char2numeric,stsm-method
### Keywords: methods

### ** Examples

# sample model with arbitrary parameter values
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 6), nopars = c("var3" = 12))
ss1 <- char2numeric(m)
c(get.pars(m), get.nopars(m), get.cpar(m))
# character notation of the covariance matrix of the state vector
m@ss$Q
# information from the slots 'pars', 'nopars' and 'cpar'
# is used to retrieve the numeric representation of 'm@ss$Q'
ss1$Q

# same as above but with P0cov=TRUE
# the only change is in the initial covariance matrix of
# the state vector 'P0'
ss2 <- char2numeric(m, P0cov = TRUE)
ss1$P0
ss2$P0

# if a non-standard parameterization is used, 
# the values in the slot 'pars' are transformed accordingly 
# and the actual variance parameters are returned;
# notice that the transformation of parameters applies only 
# to the parameters defined in the slot 'pars'
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 6), nopars = c("var3" = 12),
  transPars = "square")
c(get.pars(m), get.nopars(m), get.cpar(m))[1:3]
ss <- char2numeric(m)
ss$H
ss$Q

# model defined in terms of relative variances,
# the variances in 'pars' are relative to the scaling parameter 'cpar',
# in this example 'cpar' is chosen to be the variance 'var1'
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var2" = 3, "var3" = 6), cpar = c("var1" = 2),
  transPars = NULL)
# the state space representation can be done with 
# relative variances (no rescaling)
ss <- char2numeric(m, rescale = FALSE)
ss$H
ss$Q
# or with absolute variances (rescaling)
ss <- char2numeric(m, rescale = TRUE)
ss$H
ss$Q

# in a model where the parameters are the relative variances 
# and with non-null 'transPars', the transformation is applied to 
# the relative variances, not to the absolute variances, i.e., 
# the relative variances are first transformed and afterwards they are 
# rescaled back to absolute variances if requested
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var2" = 3, "var3" = 6), cpar = c("var1" = 2),
  transPars = "square")
# the state space representation can be done with 
# relative variances (no rescaling)
ss <- char2numeric(m, rescale = FALSE)
ss$H
ss$Q
# or with absolute variances (rescaling)
ss <- char2numeric(m, rescale = TRUE)
ss$H
ss$Q



