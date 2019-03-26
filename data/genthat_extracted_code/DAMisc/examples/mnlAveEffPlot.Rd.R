library(DAMisc)


### Name: mnlAveEffPlot
### Title: Average Effects Plot for Multinomial Logistic Regression
### Aliases: mnlAveEffPlot

### ** Examples

library(nnet)
data(france)
mnl.mod <- multinom(vote ~ age + male + retnat + lrself, data=france)
## Not run: mnlAveEffPlot(mnl.mod, "lrself", data=france)



