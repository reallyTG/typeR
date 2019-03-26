library(logmult)


### Name: yrcskew
### Title: Fitting Yamaguchi RC_SK Skew-Symmetric Association Model
### Aliases: yrcskew print.yrcskew

### ** Examples

  ## Yamaguchi (1990), Table 5, p. 202, and Table 6B, p. 205
  data(ocg1973)

  # Simple symmetric RC(1) model ("Null skew-symmetry")
  rc.model <- rc(ocg1973, diagonal=TRUE, symmetric=TRUE, weighting="none")
  # Reported phi is slightly different, coefficients agree
  rc.model

  # Note model does not always converge, several attempts may be needed
  # Here we set known starting values to be sure it works
  set.seed(5)
  model <- yrcskew(ocg1973, nd.symm=1, nd.skew=1, diagonal=TRUE, weighting="none")

  # We do not get the same results as the author, but the smaller deviance
  # indicates a better fit in our version (!)
  model



