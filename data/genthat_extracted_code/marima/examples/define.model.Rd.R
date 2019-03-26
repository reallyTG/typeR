library(marima)


### Name: define.model
### Title: define.model
### Aliases: define.model

### ** Examples

#
# Example 1: 3-variate arma model with ar-lags at 1 and 2, and an
# ma-term at lag 1. And var=3 is a regression variable (X-variable).
#
 Model1 <- define.model(kvar=3, ar=c(1, 2), ma=c(1), reg.var=3)
 short.form(Model1$ar.pattern)
 short.form(Model1$ma.pattern, leading=FALSE)
#
# The object Model1 contains the ar- and ma-pattern arrays as defined.
#
# Model1$ar.pattern and Model1$ma.pattern are used as input to
# marima in order to define the model to be estimated.
#
# Example 2: arma model with ar-lags at 1, 2 and 6, and var=3
#  regression variable (X-variable).
#
 Model2 <- define.model(kvar=3, ar=c(1, 2, 6), ma=c(1), reg.var=3)
# Print the ar- and ma-polynomial patterns using
 short.form(Model2$ar.pattern, leading=FALSE)
 short.form(Model2$ma.pattern, leading=TRUE)
#
# Example 3: arma model with ar-lags at 1, 2 and 6, and reg.var=3
# (X-variable). ma-order=1. Finally (ar.fill=c(2, 3, 4) puts  a '1'
# for (dep-var=2, indep-var=3, ar-lag=4).
#
# If further modifications of the ar- or ma-patterns are needed, it
# can be accomplished before calling marima (Model3$ar.pattern and
# Model3$ma.pattern are arrays).
#
 Model3 <- define.model(kvar=3, ar=c(1, 2, 6), ma=c(1), reg.var=3,
    ar.fill=c(2, 3, 4))
 short.form(Model3$ar.pattern)
 short.form(Model3$ma.pattern)
#
 Model4 <- define.model(kvar=3, ar=c(1, 2, 6), ma=c(1), reg.var=3, 
 ar.fill=c(2, 3, 4), indep=c(1))
 short.form(Model4$ar.pattern)
 short.form(Model4$ma.pattern, leading=FALSE)




