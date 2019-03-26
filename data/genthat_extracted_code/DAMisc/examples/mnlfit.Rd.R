library(DAMisc)


### Name: mnlfit
### Title: Fit Statistics and Specification Test for Multinomial Logistic
###   Regression
### Aliases: mnlfit print.mnlfit

### ** Examples

library(nnet)
data(france)
mnl.mod <- multinom(vote ~ age + male + retnat + lrself, data=france)
mnlfit(mnl.mod)



