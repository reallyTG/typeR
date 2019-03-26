library(VarReg)


### Name: semiVarReg
### Title: Semi parametric mean and variance regression
### Aliases: semiVarReg

### ** Examples

data(mcycle)
## run a model with linear mean and linear variance:
linmodel<-semiVarReg(mcycle$accel, mcycle$times, meanmodel="linear", varmodel="linear",
 maxit=10000)
## run a model with semi-parametric mean (4 internal knots) and semi-parametric variance (2 knots):
##not run
##semimodel<-semiVarReg(mcycle$accel, mcycle$times, meanmodel="semi", varmodel="semi",
##knots.m=4, knots.v=2, maxit=10000)
## run a model with semi-parametric mean (4 internal knots) and semi-parametric monotonic
## variance (2 knots):
## not run
##semimodel_inc<-semiVarReg(mcycle$accel, mcycle$times, meanmodel="semi", varmodel="semi",
##knots.m=4, knots.v=2, mono.var="inc")



