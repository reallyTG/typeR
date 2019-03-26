library(car)


### Name: deltaMethod
### Title: Estimate and Standard Error of a Nonlinear Function of Estimated
###   Regression Coefficients
### Aliases: deltaMethod deltaMethod.default deltaMethod.lm deltaMethod.nls
###   deltaMethod.multinom deltaMethod.polr deltaMethod.survreg
###   deltaMethod.coxph deltaMethod.mer deltaMethod.merMod deltaMethod.lme
###   deltaMethod.lmList
### Keywords: models regression

### ** Examples

m1 <- lm(time ~ t1 + t2, data = Transact) 
deltaMethod(m1, "b1/b2", parameterNames= paste("b", 0:2, sep="")) 
deltaMethod(m1, "t1/t2") # use names of preds. rather than coefs.
deltaMethod(m1, "t1/t2", vcov=hccm) # use hccm function to est. vars.
# to get the SE of 1/intercept, rename coefficients
deltaMethod(m1, "1/b0", parameterNames= paste("b", 0:2, sep=""))
# The next example calls the default method by extracting the
# vector of estimates and covariance matrix explicitly
deltaMethod(coef(m1), "t1/t2", vcov.=vcov(m1))
# the following works:
a <- 5
deltaMethod(m1, "(t1 + a)/t2")
# ...but embedded in a function this will fail
f1 <- function(mod, ...) {
 z <- 3
 deltaMethod(m1, "(t1+z)/t2", ...)
 }
## Not run: f1(m1)
# if z is defined globally f1 could even return the wrong answer.
# the following function works
f2 <- function(mod, ...) {
 deltaMethod(m1, "(t1+z)/t2", ...)
 }
f2(m1, constants=c(z=3))
# as does
f3 <- function(mod) {
 a <- 3
 deltaMethod(m1, "(t1+z)/t2", constants=c(z=a))
 }
f3(m1)



