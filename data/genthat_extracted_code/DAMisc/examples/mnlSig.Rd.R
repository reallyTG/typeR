library(DAMisc)


### Name: mnlSig
### Title: Print Statistically Significant MNL Coefficients
### Aliases: mnlSig

### ** Examples

library(nnet)
data(france)
mnl.mod <- multinom(vote ~ retnat + male + retnat + lrself, data=france)
mnlSig(mnl.mod)



