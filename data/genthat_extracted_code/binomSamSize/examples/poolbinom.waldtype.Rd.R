library(binomSamSize)


### Name: poolbinom.logit
### Title: Calculate logit based confidence interval for binomial
###   proportion for pooled samples
### Aliases: poolbinom.logit poolbinom.wald poolbinom.waldtype
### Keywords: design survey

### ** Examples

poolbinom.wald(x=0, k=10, n=34, conf.level=0.95)
poolbinom.logit(x=0:1, k=10, n=34, conf.level=0.95)
poolbinom.logit(x=1, k=seq(10,100,by=10), n=34, conf.level=0.95)
poolbinom.logit(x=0:34,k=1,n=34)



