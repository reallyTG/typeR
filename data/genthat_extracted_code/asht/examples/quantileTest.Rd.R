library(asht)


### Name: quantileTest
### Title: Tests and Confidence Intervals about a Quantile.
### Aliases: quantileTest quantileTest.default quantileTest.ordered
###   medianTest
### Keywords: ~kwd1 ~kwd2

### ** Examples

## For Poisson(mean=2.5) the median is 2
x<-rpois(20,2.5)
medianTest(x)
x<-ordered(c(rep("A",10),rep("B",60),rep("C",30)),levels=c("A","B","C"))
xnum<-as.numeric(x)
quantileTest(xnum,q=2,prob=0.705)
quantileTest(x,q=2,prob=0.705)



