library(DOvalidation)


### Name: DOvalidation-package
### Title: Kernel Hazard Estimation with Best One-Sided and Double
###   One-Sided Cross-Validation
### Aliases: DOvalidation-package DOvalidation
### Keywords: package nonparametric survival

### ** Examples

data(Iceland)
Oi<-Iceland$D
Ei<-Iceland$E
ti<-40:110  # time is age and it goes from 40 to 110 years
## Local linear hazard estimator 
## and its multiplicatively bias corrected version (MBC)
## with best one-sided cross-validated bandwidths
## Note: use functions b.BO and b.BO.MBC to get these bandwidths
##       (48.7 and 14.6, respectively)
res.LL<-hazard.LL(xi=ti,Oi=Oi,Ei=Ei,x=ti,b=14.6)
res.MBC<-hazard.MBC(xi=ti,Oi=Oi,Ei=Ei,x=ti,b=48.7)
plot(ti,res.LL$hLL,main='Hazard estimates',xlab='age',ylab='',
    type='l',col=4,lwd=2)
lines(ti,res.MBC$hMBC,col=2,lwd=2)
legend("topleft",bt="n",c("Local linear", "MBC"),col=c(4,2),lwd=2)



