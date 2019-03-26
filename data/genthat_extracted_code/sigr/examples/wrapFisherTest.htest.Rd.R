library(sigr)


### Name: wrapFisherTest.htest
### Title: Wrap fisher.test (test of categorical independence).
### Aliases: wrapFisherTest.htest

### ** Examples


d <- data.frame(x=c('b','a','a','a','b','b','b'),
                y=c('1','1','1','2','2','2','2'))
ft <- fisher.test(table(d))
wrapFisherTest(ft)





