library(lqr)


### Name: Log.best.lqr
### Title: Best Fit in Robust Logistic Linear Quantile Regression
### Aliases: Log.best.lqr
### Keywords: bounded logistic quantile regression skew

### ** Examples

## Not run: 
##D ##Load the data
##D data(resistance)
##D attach(resistance)
##D 
##D #EXAMPLE 1.1
##D 
##D #Comparing the resistence to death of two types of tumor-cells.
##D #The response is a score in [0,4].
##D 
##D boxplot(score~type)
##D 
##D #Median logistic quantile regression (Best fit distribution)
##D res = Log.best.lqr(y = score,x = cbind(1,type),a=0,b=4)
##D 
##D # The odds ratio of median score in type B vs type A
##D exp(res$beta[2])
##D 
##D #Proving that exp(res$beta[2])  is approx median odd ratio
##D medA  = median(score[type=="A"])
##D medB  = median(score[type=="B"])
##D rateA = (medA - 0)/(4 - medA)
##D rateB = (medB - 0)/(4 - medB)
##D odd   = rateB/rateA
##D 
##D round(c(exp(res$beta[2]),odd),3) #better fitted
##D 
##D #EXAMPLE 1.2
##D ############
##D 
##D #Comparing the resistence to death depending of dose.
##D 
##D #descriptive
##D plot(dose,score,ylim=c(0,4),col="dark gray");abline(h=c(0,4),lty=2)
##D dosecat<-cut(dose, 6, ordered = TRUE)
##D boxplot(score~dosecat,ylim=c(0,4))
##D abline(h=c(0,4),lty=2)
##D 
##D #(Non logistic) Best quantile regression for quantiles
##D # 0.05, 0.50 and 0.95
##D xx1  = dose
##D xx2  = dose^2
##D xx3  = dose^3
##D res31 = best.lqr(y = score,x = cbind(1,xx1,xx2,xx3),p = 0.05)
##D res32 = best.lqr(y = score,x = cbind(1,xx1,xx2,xx3),p = 0.50)
##D res33 = best.lqr(y = score,x = cbind(1,xx1,xx2,xx3),p = 0.95)
##D res3  = list(res31,res32,res33)
##D seqq=seq(min(dose),max(dose),length.out = 1000)
##D dd = matrix(data = NA,nrow = 1000,ncol =3)
##D for(i in 1:3)
##D {
##D   dd[,i] = rep(res3[[i]]$beta[1],1000) + res3[[i]]$beta[2]*seqq +
##D     res3[[i]]$beta[3]*seqq^2 + res3[[i]]$beta[4]*seqq^3
##D }
##D 
##D plot(dose,score,ylim=c(-1,5),col="gray");abline(h=c(0,4),lty=2)
##D lines(seqq,dd[,1],lwd=1,col=2)
##D lines(seqq,dd[,2],lwd=1,col=1)
##D lines(seqq,dd[,3],lwd=1,col=2)
##D 
##D #Using logistic quantile regression for obtaining predictions inside bounds
##D 
##D res41 = Log.best.lqr(y = score,x = cbind(1,xx1,xx2,xx3),a=0,b=4,p = 0.05)
##D res42 = Log.best.lqr(y = score,x = cbind(1,xx1,xx2,xx3),a=0,b=4,p = 0.50)
##D res43 = Log.best.lqr(y = score,x = cbind(1,xx1,xx2,xx3),a=0,b=4,p = 0.95)
##D res4  = list(res41,res42,res43)
##D dd = matrix(data = NA,nrow = 1000,ncol =3)
##D for(i in 1:3)
##D {
##D   dd[,i] = rep(res4[[i]]$beta[1],1000) + res4[[i]]$beta[2]*seqq +
##D     res4[[i]]$beta[3]*seqq^2 + res4[[i]]$beta[4]*seqq^3
##D }
##D 
##D #Computing quantiles for the original response (Inverse trnasformation)
##D 
##D pred = function(predlog,a,b)
##D {
##D   return((b*exp(predlog)+a)/(1+exp(predlog)))
##D }
##D 
##D for(i in 1:3)
##D {
##D   dd[,i] = pred(dd[,i],a=0,b=4)
##D }           
##D 
##D #No more prediction curves outof bounds
##D plot(dose,score,ylim=c(0,4),col="gray");abline(h=c(0,4),lty=2)
##D lines(seqq,dd[,1],lwd=1,col=2)
##D lines(seqq,dd[,2],lwd=1,col=1)
##D lines(seqq,dd[,3],lwd=1,col=2)
##D 
## End(Not run)



