library(coxsei)


### Name: RND
### Title: Random number generator
### Aliases: RND
### Keywords: ~datagen ~distribution ~survival

### ** Examples

set.seed(1)
dat <- RND(100,int=function(x)x^2)
ks.test(dat,pweibull,shape=3) # p-value = 0.6058
qqplot(dat,rweibull(100,shape=3))  



