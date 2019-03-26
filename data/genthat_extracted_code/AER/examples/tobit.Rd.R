library(AER)


### Name: tobit
### Title: Tobit Regression
### Aliases: tobit print.tobit summary.tobit print.summary.tobit
###   formula.tobit model.frame.tobit update.tobit waldtest.tobit
###   lrtest.tobit linearHypothesis.tobit deviance.survreg fitted.survreg
###   nobs.survreg weights.survreg
### Keywords: regression

### ** Examples

data("Affairs")

## from Table 22.4 in Greene (2003)
fm.tobit <- tobit(affairs ~ age + yearsmarried + religiousness + occupation + rating,
  data = Affairs)
fm.tobit2 <- tobit(affairs ~ age + yearsmarried + religiousness + occupation + rating,
  right = 4, data = Affairs)

summary(fm.tobit)
summary(fm.tobit2)



