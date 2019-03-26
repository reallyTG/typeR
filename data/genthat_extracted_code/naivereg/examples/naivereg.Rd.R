library(naivereg)


### Name: naivereg
### Title: Nonparametric additive instrumental variable estimator
### Aliases: naivereg

### ** Examples

#naive regression
library(naivereg)
data("naivedata")
x=naivedata[,1]
y=naivedata[,2]
z=naivedata[,3:102]
#estimate with intercept
naive_intercept= naivereg(y,x,z)
#estimate without intercept,criterion:EBIC
naive_without_intercept = naivereg(y,x,z,intercept=FALSE,criterion='EBIC')



