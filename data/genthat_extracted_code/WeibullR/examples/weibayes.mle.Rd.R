library(WeibullR)


### Name: weibayes.mle
### Title: Fitting for Minimal Failure Datasets using likelihood
###   optimization
### Aliases: weibayes.mle

### ** Examples

fail<-5
susp<-rweibull(10, 1, 10)
eta<-weibayes.mle(mleframe(fail, susp), beta=1)



