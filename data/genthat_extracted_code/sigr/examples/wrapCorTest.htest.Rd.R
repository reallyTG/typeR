library(sigr)


### Name: wrapCorTest.htest
### Title: Wrap cor.test (test of liner correlation).
### Aliases: wrapCorTest.htest

### ** Examples


d <- data.frame(x=c(1,2,3,4,5,6,7,7),
                y=c(1,1,2,2,3,3,4,4))
ct <- cor.test(d$x,d$y)
wrapCorTest(ct)





