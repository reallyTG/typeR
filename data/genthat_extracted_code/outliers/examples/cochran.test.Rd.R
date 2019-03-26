library(outliers)


### Name: cochran.test
### Title: Test for outlying or inlying variance
### Aliases: cochran.test
### Keywords: htest

### ** Examples

set.seed(1234)
x=rnorm(100)
d=data.frame(x=x,group=rep(1:10,10))
cochran.test(x~group,d)
cochran.test(x~group,d,inlying=TRUE)
x=runif(5)
cochran.test(x,rep(5,5))
cochran.test(x,rep(100,5))



