library(mpr)


### Name: stepmpr
### Title: Stepwise Selection Procedure for Multi-Parameter Regression
###   (MPR) Models
### Aliases: stepmpr

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

#######
mod0 <- mpr(Surv(time, status) ~ 1, data=veteran)
mod0 # family = "Weibull" by default

# the "upper" model formula (by default the lower will be ~ 1)
scope <- ~ trt + celltype

stepmpr(mod0, scope)
stepmpr(mod0, scope, direction="forward", aic=FALSE)

# individual steps only
stepmpr(mod0, scope, joint=FALSE)

# joint steps only
stepmpr(mod0, scope, jointonly=TRUE)

# component 1 only (and, hence, only individual steps)
stepmpr(mod0, scope, comp=1)

#######
mod1 <- mpr(Surv(time, status) ~ trt + celltype, data=veteran)
mod1

stepmpr(mod1)
stepmpr(mod1, scope = ~ .^2)

# "lower" model formula forces trt to stay in
stepmpr(mod1, scope = list(~trt, ~.))




