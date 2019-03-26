library(ibd)


### Name: ibdtvc
### Title: incomplete block design for test vs control(s) comparions
### Aliases: ibdtvc
### Keywords: incomplete block design test vs control(s) comparison

### ** Examples
NNPo=matrix(c(7,3,3,3,3,3,3,3,3,7,3,3,3,3,3,3,3,3,7,3,3,3,3,3,3,3,3,7,3,3,3,3,3,3,3,3,7,
3,3,3,3,3,3,3,3,7,3,3,3,3,3,3,3,3,9,9,3,3,3,3,3,3,9,9),nrow=8,byrow=TRUE)
ibdtvc(6,2,15,4,NNPo)



