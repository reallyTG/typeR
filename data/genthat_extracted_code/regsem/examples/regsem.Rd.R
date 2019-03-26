library(regsem)


### Name: regsem
### Title: Regularized Structural Equation Modeling. Tests a single
###   penalty. For testing multiple penalties, see cv_regsem().
### Aliases: regsem
### Keywords: calc optim

### ** Examples

# Note that this is not currently recommended. Use cv_regsem() instead
# vignette("overview",package="regsem")
library(lavaan)
# put variables on same scale for regsem
HS <- data.frame(scale(HolzingerSwineford1939[,7:15]))
mod <- '
f =~ 1*x1 + l1*x2 + l2*x3 + l3*x4 + l4*x5 + l5*x6 + l6*x7 + l7*x8 + l8*x9
'
# Recommended to specify meanstructure in lavaan
outt = cfa(mod, HS, meanstructure=TRUE)

fit1 <- regsem(outt, lambda=0.05, type="lasso",
  pars_pen=c("l1", "l2", "l6", "l7", "l8"))
#equivalent to pars_pen=c(1:2, 6:8)
#summary(fit1)



