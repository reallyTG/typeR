library(lba)


### Name: print.lba
### Title: Print Method for 'lba' objects.
### Aliases: print.lba.ls print.lba.ls.fe print.lba.ls.logit print.lba.mle
###   print.lba.mle.fe print.lba.mle.logit
### Keywords: package lba

### ** Examples

data('votB') 

# Using LS method (default) without constraint
# K = 2
ex1 <- lba(city ~ parties,
           votB,
           K = 2)
ex1
 



