library(sigr)


### Name: wrapFisherTest.table
### Title: Wrap fisher.test (test of categorical independence).
### Aliases: wrapFisherTest.table

### ** Examples


d <- data.frame(x=c('b','a','a','a','b','b','b'),
                y=c('1','1','1','2','2','2','2'))
t <- table(d)
wrapFisherTest(t)





