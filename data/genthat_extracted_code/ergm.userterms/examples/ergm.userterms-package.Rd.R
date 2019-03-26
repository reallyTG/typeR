library(ergm.userterms)


### Name: ergm.userterms-package
### Title: User-defined terms used in Exponential Family Random Graph
###   Models
### Aliases: ergm.userterms-package ergm.userterms
### Keywords: package models

### ** Examples

data(faux.mesa.high)
summary(faux.mesa.high~mindegree(2))
fit <- ergm(faux.mesa.high~mindegree(2), estimate="MPLE")
summary(fit)



