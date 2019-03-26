library(multilevel)


### Name: mult.icc
### Title: Multiple ICCs from a dataset
### Aliases: mult.icc
### Keywords: attribute

### ** Examples

library(nlme)
data(bh1996)
mult.icc(bh1996[,c("HRS","LEAD","COHES")],grpid=bh1996$GRP)




