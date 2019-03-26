library(psychotools)


### Name: rsmodel
### Title: Rating Scale Model Fitting Function
### Aliases: rsmodel RSModel.fit print.rsmodel summary.rsmodel
###   print.summary.rsmodel coef.rsmodel bread.rsmodel estfun.rsmodel
###   logLik.rsmodel vcov.rsmodel
### Keywords: regression

### ** Examples

o <- options(digits = 4)

## Verbal aggression data
data("VerbalAggression", package = "psychotools")

## Rating scale model for the other-to-blame situations
rsm <- rsmodel(VerbalAggression$resp[, 1:12])
summary(rsm)

## visualizations
plot(rsm, type = "profile")
plot(rsm, type = "regions")
plot(rsm, type = "curves")
plot(rsm, type = "information")
plot(rsm, type = "piplot")

options(digits = o$digits)



