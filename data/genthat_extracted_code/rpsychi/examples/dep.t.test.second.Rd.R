library(rpsychi)


### Name: dep.t.test.second
### Title: A t-test with dependent samples using published work: Reporting
###   effect size
### Aliases: dep.t.test.second
### Keywords: design htest

### ** Examples
 
##Kline (2004) Table 4.4
dat <- data.frame(y = c(9,12,13,15,16,8,12,11,10,14),
                  x =  rep(factor(c("a","b")), each=5),
                  subj = rep(paste("s", 1:5, sep=""), times=2)
                  )
datwide <- reshape(dat, direction="wide", idvar="subj", timevar="x")

dep.t.test.second(m = tapply(dat$y, dat$x, mean),
                  sd = tapply(dat$y, dat$x, sd),
                  n = nlevels(dat$subj),
                  corr = cor(datwide[,2:3])[1,2]
                  )

dep.t.test.second(m = tapply(dat$y, dat$x, mean),
                  sd = tapply(dat$y, dat$x, sd),
                  n = 30,
                  corr = cor(datwide[,2:3])[1,2]
                  )



