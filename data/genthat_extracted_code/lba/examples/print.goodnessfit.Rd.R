library(lba)


### Name: print.goodnessfit
### Title: Print Method for goodnessfit objects.
### Aliases: print.goodnessfit.lba.ls print.goodnessfit.lba.ls.fe
###   print.goodnessfit.lba.ls.logit print.goodnessfit.lba.mle
###   print.goodnessfit.lba.mle.fe print.goodnessfit.lba.mle.logit
### Keywords: package goodnessfit

### ** Examples

data('votB')

# Using LS method (default) without constraint
# K = 2
ex1 <- lba(city ~ parties,
           votB,
           K = 2)
exm <- goodnessfit(ex1)
exm




