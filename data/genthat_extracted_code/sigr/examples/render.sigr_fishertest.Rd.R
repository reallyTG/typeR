library(sigr)


### Name: render.sigr_fishertest
### Title: Format fisher.test (test of categorical independence).
### Aliases: render.sigr_fishertest

### ** Examples


d <- data.frame(x=c('b','a','a','a','b','b','b'),
                y=c('1','1','1','2','2','2','2'))
ft <- fisher.test(table(d))
wrapFisherTest(ft)





