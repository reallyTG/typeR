library(stsm.class)


### Name: stsm-transPars-methods
### Title: Parameterization of Models Defined in the Class 'stsm'
### Aliases: stsm-transPars-methods transPars,generic-method
###   transPars,numeric-method transPars,stsm-method transPars
### Keywords: methods

### ** Examples

# sample models with arbitrary parameter values

# model in standard parameterization
# ower bounds imposed on the variance parameters
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30), transPars = NULL)
get.pars(m)
m@lower

# square transformation
# negative values are allowed in 'pars' since 
# the square will yield positive variances
# in fact no lower bounds need to be imposed on the auxiliar parameters
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = -2, "var2" = -5, "var3" = 10), transPars = "square")
validObject(m)
m@lower
m@pars
get.pars(m)

# 'ftrans', alternative transformation of parameters;
# the following parameterization is sometimes found:
# variance = exp(-theta) / 10
# the function 'ftrans' following the rules given in the details 
# above can be defined as follows:

ftrans <- function(x, gradient = FALSE, hessian = FALSE)
{
  tpars <- x
  p <- length(x)
  nmspars <- names(x)
  idvar <- grep("^var|P0\\d{1,2}$", nmspars, value = FALSE)

  if (gradient) {
    d1 <- rep(NA, p)
    names(d1) <- nmspars
  } else d1 <- NULL
  if (hessian) {
    d2 <- matrix(0, p, p)
    rownames(d2) <- colnames(d2) <- nmspars
  } else d2 <- NULL

  if (length(idvar) > 0) {
    tpars[idvar] <- exp(-x[idvar]) / 10
  } else warning("No changes done by 'transPars'.")

  if (gradient)
  {
    if (length(idvar) > 0)
      d1[idvar] <- -tpars[idvar]
  }
  if (hessian) {
    diag(d2)[idvar] <- tpars[idvar]
  }
  
  list(pars = tpars, gradient = d1, hessian = d2)
}

# now 'ftrans' can be passed to 'transPars' and be applied
# on a named vector of parameters or on a 'stsm' object
transPars(c("var1" = 2, "var2" = 15, "var3" = 30), 
  ftrans = ftrans, gradient = TRUE, hessian = TRUE)
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30), transPars = ftrans)
get.pars(m)



