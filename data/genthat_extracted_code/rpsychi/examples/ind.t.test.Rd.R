library(rpsychi)


### Name: ind.t.test
### Title: A t-test with independent samples using individual data:
###   Reporting effect size
### Aliases: ind.t.test
### Keywords: design htest

### ** Examples

##Kline (2004) Table 4.4
dat <- data.frame(y = c(9,12,13,15,16,8,12,11,10,14),
                  x =  rep(factor(c("a","b")), each=5)
                  )
ind.t.test(y~x, data=dat, correct=FALSE)



