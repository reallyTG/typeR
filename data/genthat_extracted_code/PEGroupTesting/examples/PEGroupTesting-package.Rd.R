library(PEGroupTesting)


### Name: PEGroupTesting-package
### Title: Population Proportion Estimation using Group Testing
### Aliases: PEGroupTesting-package PEGroupTesting
### Keywords: Group testing, maximum likelihood estimate, order statistics,
###   Burrow's method, Gart's method

### ** Examples

library(PEGroupTesting)
mydata=matrix(c(50,10,45),nrow=1,ncol=3,byrow=TRUE)
p.mle(mydata)
p.burrow(mydata)
p.gart(mydata)
p.order(mydata)



