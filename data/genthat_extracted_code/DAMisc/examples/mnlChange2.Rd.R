library(DAMisc)


### Name: mnlChange2
### Title: Average Effects for Multinomial Logistic Regression Models
### Aliases: mnlChange2

### ** Examples

library(nnet)
data(france)
mnl.mod <- multinom(vote ~ age + male + retnat + lrself, data=france)
mnlChange2(mnl.mod, "lrself", data=france, )	





