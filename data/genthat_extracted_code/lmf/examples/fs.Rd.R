library(lmf)


### Name: fs
### Title: Estimate temporal coefficients of selection
### Aliases: fs

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Extract At and at
At <- lmf.1$At
at <- lmf.1$at
#Estimate temporal selection coefficients
flusel <- fs(At = At, at = at, npar = 3, nyear = 7, method = "BFGS",
  control = list(maxit = 500, reltol = sqrt(.Machine$double.eps)))
#View output
str(flusel)
flusel



