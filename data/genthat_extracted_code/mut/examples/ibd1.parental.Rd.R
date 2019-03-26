library(mut)


### Name: ibd1.parental
### Title: Estimates for a pair of non-inbred individuals the probabilities
###   of paternal origin when IBD is 1
### Aliases: ibd1.parental uniformMap

### ** Examples

library(IBDsim)
x = doubleFirstCousins()
ids = c(9,10)
ibd1.parental(x, ids, 10)$alpha.hat
x = swapSex(x,3)
ibd1.parental(x, ids, 10)$alpha.hat



