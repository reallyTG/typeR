library(asht)


### Name: signTest
### Title: Exact Sign Test with Confidence Intervals
### Aliases: signTest
### Keywords: htest

### ** Examples

x<-c(rep(-1,10),rep(0,60),rep(1,30))
signTest(x)
# sample median is zero, 
# and not surprisingly the median test 
# properly gives a large p-value
medianTest(x)



