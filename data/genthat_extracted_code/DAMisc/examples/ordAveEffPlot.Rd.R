library(DAMisc)


### Name: ordAveEffPlot
### Title: Plot Average Effects of Variables in Proportional Odds Logistic
###   Regression
### Aliases: ordAveEffPlot

### ** Examples

library(MASS)
data(france)
polr.mod <- polr(vote ~ age + male + retnat + lrself, data=france)
## Not run: ordAveEffPlot(polr.mod, "lrself", data=france)	



