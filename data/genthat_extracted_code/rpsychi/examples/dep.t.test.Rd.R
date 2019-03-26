library(rpsychi)


### Name: dep.t.test
### Title: A t-test with dependent samples using individual data: Reporting
###   effect size
### Aliases: dep.t.test
### Keywords: design htest

### ** Examples
 
##Kline (2004) Table 4.4
dat <- data.frame(y = c(9,12,13,15,16,8,12,11,10,14),
                  x =  rep(factor(c("a","b")), each=5),
                  subj = rep(paste("s", 1:5, sep=""), times=2)
                  )
dep.t.test(y~x, block="subj", data=dat)




