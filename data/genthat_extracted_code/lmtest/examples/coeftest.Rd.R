library(lmtest)


### Name: coeftest
### Title: Inference for Estimated Coefficients
### Aliases: coeftest coefci coeftest.default coeftest.survreg coeftest.glm
###   coeftest.mlm coeftest.breakpointsfull print.coeftest coefci.default
###   coefci.survreg coefci.glm coefci.mlm
### Keywords: htest

### ** Examples

## load data and fit model
data("Mandible", package = "lmtest")
fm <- lm(length ~ age, data = Mandible, subset=(age <= 28))

## the following commands lead to the same tests:
summary(fm)
coeftest(fm)

## a z test (instead of a t test) can be performed by
coeftest(fm, df = Inf)

## corresponding confidence intervales
coefci(fm)
## which in this simple case is equivalent to
confint(fm)

if(require("sandwich")) {
## a different covariance matrix can be also used:
## either supplied as a function
coeftest(fm, df = Inf, vcov = vcovHC)
## or as a function with additional arguments
coeftest(fm, df = Inf, vcov = vcovHC, type = "HC0")
## or as a matrix
coeftest(fm, df = Inf, vcov = vcovHC(fm, type = "HC0"))
}



