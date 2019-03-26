library(basefun)


### Name: as.basis
### Title: Convert Formula or Factor to Basis Function
### Aliases: as.basis as.basis.formula as.basis.factor_var
###   as.basis.ordered_var as.basis.factor as.basis.ordered

### ** Examples


  ## define variables and basis functions
  v <- c(numeric_var("x"), factor_var("y", levels = LETTERS[1:3]))
  fb <- as.basis(~ x + y, data = v, remove_intercept = TRUE, negative = TRUE,
                 contrasts.arg = list(y = "contr.sum"))

  ## evaluate basis functions
  model.matrix(fb, data = as.data.frame(v, n = 10))
  ## basically the same as (but wo intercept and times -1)
  model.matrix(~ x + y, data = as.data.frame(v, n = 10))

  ### factor
  xf <- gl(3, 1)
  model.matrix(as.basis(xf), data = data.frame(xf = xf))

  ### ordered
  xf <- gl(3, 1, ordered = TRUE)
  model.matrix(as.basis(xf), data = data.frame(xf = unique(xf)))




