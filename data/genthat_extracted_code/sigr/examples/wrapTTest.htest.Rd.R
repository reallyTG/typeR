library(sigr)


### Name: wrapTTest.htest
### Title: Wrap t.test (difference in means by group).
### Aliases: wrapTTest.htest

### ** Examples


d <- data.frame(x=c(1,2,3,4,5,6,7,7),
                y=c(1,1,2,2,3,3,4,4))
tt <- t.test(d$x,d$y)
render(wrapTTest(tt),pLargeCutoff=1)
# confirm not rescaling, as a correlation test would
render(wrapTTest(t.test(d$x,2*d$y)),pLargeCutoff=1)




