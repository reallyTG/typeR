library(rpsychi)


### Name: ind.t.test.second
### Title: A t-test with independent samples using published work:
###   Reporting effect size
### Aliases: ind.t.test.second
### Keywords: design htest

### ** Examples

##Kline (2004) Table 4.4
dat <- data.frame(y = c(9,12,13,15,16,8,12,11,10,14),
                  x =  rep(factor(c("a","b")), each=5)
                  )
ind.t.test.second(m = tapply(dat$y, dat$x, mean),
                  sd = tapply(dat$y, dat$x, sd),
                  n = tapply(dat$y, dat$x, length), correct=FALSE
                  )
ind.t.test.second(m = tapply(dat$y, dat$x, mean),
                  sd = tapply(dat$y, dat$x, sd),
                  n = tapply(dat$y, dat$x, length), correct=TRUE
                  )     #approximate unbiased estimator of delta



