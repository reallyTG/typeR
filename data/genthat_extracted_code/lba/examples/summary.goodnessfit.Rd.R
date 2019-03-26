library(lba)


### Name: summary.goodnessfit
### Title: Summary Method for goodnessfit objects.
### Aliases: summary.goodnessfit.lba.ls summary.goodnessfit.lba.ls.fe
###   summary.goodnessfit.lba.ls.logit summary.goodnessfit.lba.mle
###   summary.goodnessfit.lba.mle.fe summary.goodnessfit.lba.mle.logit
### Keywords: package goodnessfit

### ** Examples

data('votB')

# Using LS method (default) without constraint
# K = 2
ex1 <- lba(city ~ parties,
           votB,
           K = 2)
exm <- goodnessfit(ex1)
summary(exm)




