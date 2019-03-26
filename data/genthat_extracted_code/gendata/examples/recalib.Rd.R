library(gendata)


### Name: recalib
### Title: Recalibrate (rescale) Variables
### Aliases: recalib
### Keywords: ~kwd1 ~kwd2

### ** Examples

sdata<-genmvnorm(cor=c(.7,.2,.3),k=3,n=500,seed=12345)
cor(sdata)
summary(sdata[,1])
#note the min and max of variable X1
#changes variable one to have a minimum of 10 and a maximum of 50
#correlations remain the same

s2<-recalib(sdata,1,10,50)
cor(s2)
summary(s2[,1])
#note revised values of variable X1




