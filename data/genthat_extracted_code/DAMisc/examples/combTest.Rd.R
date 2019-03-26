library(DAMisc)


### Name: combTest
### Title: Test for Combining Categories in Multinomial Logistic Regression
###   Models.
### Aliases: combTest

### ** Examples

library(nnet)
data(france)
mnl.mod <- multinom(vote ~ age + male + retnat + lrself, data=france)
combTest(mnl.mod)




