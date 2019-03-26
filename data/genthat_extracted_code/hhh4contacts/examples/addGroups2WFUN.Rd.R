library(hhh4contacts)


### Name: addGroups2WFUN
### Title: Group-Dependent Parametric Weights
### Aliases: addGroups2WFUN

### ** Examples

data("measlesWeserEms")
WPLgroups <- addGroups2WFUN(
  W_powerlaw(maxlag = 5, normalize = FALSE, log = FALSE),
  groups = factor(sample(2, ncol(measlesWeserEms), replace = TRUE)))



