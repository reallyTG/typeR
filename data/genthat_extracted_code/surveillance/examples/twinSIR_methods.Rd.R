library(surveillance)


### Name: twinSIR_methods
### Title: Print, Summary and Extraction Methods for '"twinSIR"' Objects
### Aliases: print.twinSIR summary.twinSIR AIC.twinSIR extractAIC.twinSIR
###   vcov.twinSIR logLik.twinSIR print.summary.twinSIR
### Keywords: methods print htest

### ** Examples

data("foofit")

foofit

coef(foofit)
vcov(foofit)
logLik(foofit)

summary(foofit, correlation = TRUE, symbolic.cor = TRUE)

# AIC or OSAIC
AIC(foofit)
AIC(foofit, one.sided = FALSE)
extractAIC(foofit)
extractAIC(foofit, one.sided = FALSE)

# just as a stupid example for the use of AIC with multiple fits
foofit2 <- foofit
AIC(foofit, foofit2)   # 2nd column should actually be named "OSAIC" here



