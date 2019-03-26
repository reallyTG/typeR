library(lba)


### Name: summary.lba
### Title: Summary Method for 'lba' objects.
### Aliases: summary.lba.ls summary.lba.ls.fe summary.lba.ls.logit
###   summary.lba.mle summary.lba.mle.fe summary.lba.mle.logit
### Keywords: package lba

### ** Examples

data('votB') 

# Using LS method (default) without constraint
# K = 2
ex1 <- lba(city ~ parties,
           votB,
           K = 2)
summary(ex1)
 



