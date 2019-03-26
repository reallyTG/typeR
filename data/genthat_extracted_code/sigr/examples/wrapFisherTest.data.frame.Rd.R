library(sigr)


### Name: wrapFisherTest.data.frame
### Title: Wrap fisher.test (test of categorical independence).
### Aliases: wrapFisherTest.data.frame

### ** Examples


d <- data.frame(x=c('b','a','a','a','b','b','b'),
                y=c('1','1','1','2','2','2','2'))
wrapFisherTest(d, 'x', 'y')





