library(psychotools)


### Name: raschmodel
### Title: Rasch Model Fitting Function
### Aliases: raschmodel RaschModel.fit print.raschmodel summary.raschmodel
###   print.summary.raschmodel coef.raschmodel bread.raschmodel
###   estfun.raschmodel logLik.raschmodel vcov.raschmodel
### Keywords: regression

### ** Examples

o <- options(digits = 4)

## Verbal aggression data
data("VerbalAggression", package = "psychotools")

## Rasch model for the other-to-blame situations
m <- raschmodel(VerbalAggression$resp2[, 1:12])
summary(m)

## visualizations
plot(m, type = "profile")
plot(m, type = "regions")
plot(m, type = "curves")
plot(m, type = "information")
plot(m, type = "piplot")

options(digits = o$digits)



