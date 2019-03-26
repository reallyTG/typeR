library(SharpeR)


### Name: sr_test
### Title: test for Sharpe ratio
### Aliases: sr_test
### Keywords: htest

### ** Examples

# should reject null
x <- sr_test(rnorm(1000,mean=0.5,sd=0.1),zeta=2,ope=1,alternative="greater")
x <- sr_test(rnorm(1000,mean=0.5,sd=0.1),zeta=2,ope=1,alternative="two.sided")
# should not reject null
x <- sr_test(rnorm(1000,mean=0.5,sd=0.1),zeta=2,ope=1,alternative="less")

# test for uniformity
pvs <- replicate(128,{ x <- sr_test(rnorm(1000),ope=253,alternative="two.sided")
                        x$p.value })
plot(ecdf(pvs))
abline(0,1,col='red') 
# testing an object of class sr
asr <- as.sr(rnorm(1000,1 / sqrt(253)),ope=253)
checkit <- sr_test(asr,zeta=0)




