library(sigr)


### Name: wrapTTest.numeric
### Title: Wrap t.test (difference in means by group).
### Aliases: wrapTTest.numeric

### ** Examples


d <- data.frame(x=c(1,2,3,4,5,6,7,7),
                y=c(1,1,2,2,3,3,4,4))
render(wrapTTest(d$x, d$y), pLargeCutoff=1)
# confirm p not order depedent
render(wrapTTest(d$y, d$x),pLargeCutoff=1)




