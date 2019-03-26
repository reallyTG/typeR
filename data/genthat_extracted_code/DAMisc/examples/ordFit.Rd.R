library(DAMisc)


### Name: ordfit
### Title: Fit Statistics for Proportional Odds Logistic Regression Models
### Aliases: ordfit print.ordfit

### ** Examples

library(MASS)
data(france)
polr.mod <- polr(vote ~ age + male + retnat + lrself, data=france)
ordfit(polr.mod)



