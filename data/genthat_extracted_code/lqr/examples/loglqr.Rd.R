library(lqr)


### Name: Log.lqr
### Title: Robust Logistic Linear Quantile Regression
### Aliases: Log.lqr
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
##D boxplot(score~type,ylab="score",xlab="type")
##D 
##D #Student't median logistic quantile regression
##D res = Log.lqr(y = score,x = cbind(1,type),a=0,b=4,dist="t")
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
##D round(c(exp(res$beta[2]),odd),3)
##D 
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
##D #Slash (Non logistic) quantile regression for quantiles 0.05, 0.50 and 0.95
##D xx1  = dose
##D xx2  = dose^2
##D xx3  = dose^3
##D res3 = lqr(y = score,x = cbind(1,xx1,xx2,xx3),p = c(0.05,0.50,0.95),dist="slash")
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
##D res4 = Log.lqr(y = score,x = cbind(1,xx1,xx2,xx3),a = 0,b = 4,p = c(0.05,0.50,0.95),dist="slash")
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
##D #EXAMPLE 1.3
##D ############
##D 
##D #A full model using dose and type for a grid of quantiles
##D 
##D typeB = 1*(type=="B")
##D res5 = Log.lqr(y = score,x = cbind(1,xx1,xx2,xx3,typeB,typeB*xx1),a = 0,b = 4,
##D                p = seq(from = 0.05,to = 0.95,by = 0.05),dist = "t")
##D ddA = ddB = matrix(data = NA,nrow = 1000,ncol = 5)
##D for(i in 1:5)
##D {
##D   k = c(2,5,10,15,18)[i]
##D   ddA[,i] = rep(res5[[k]]$beta[1],1000) + res5[[k]]$beta[2]*seqq + res5[[k]]$beta[3]*
##D     seqq^2 + res5[[k]]$beta[4]*seqq^3
##D   ddB[,i] = rep(res5[[k]]$beta[1],1000) + (res5[[k]]$beta[2] + res5[[k]]$beta[6])*
##D     seqq + res5[[k]]$beta[3]*seqq^2 + res5[[k]]$beta[4]*seqq^3  + res5[[k]]$beta[5]
##D }
##D 
##D #Computing quantiles for the original response (Inverse transformation)
##D 
##D for(i in 1:5)
##D {
##D   ddA[,i] = pred(ddA[,i],a=0,b=4)
##D   ddB[,i] = pred(ddB[,i],a=0,b=4)
##D } 
##D 
##D #Such a beautiful plot
##D par(mfrow=c(1,2))
##D plot(dose,score,ylim=c(0,4),col=c((type == "B")*8+(type == "A")*1),main="Type A")
##D abline(h=c(0,4),lty=2)
##D lines(seqq,ddA[,1],lwd=2,col=2)
##D lines(seqq,ddA[,2],lwd=1,col=4)
##D lines(seqq,ddA[,3],lwd=2,col=1)
##D lines(seqq,ddA[,4],lwd=1,col=4)
##D lines(seqq,ddA[,5],lwd=2,col=2)
##D 
##D legend(x = 0,y=4,legend = c("p=0.10","p=0.25","p=0.50","p=0.75","p=0.90")
##D        ,col=c(2,4,1,4,2),lwd=c(2,1,2,1,2),bty = "n",cex=0.65)
##D 
##D plot(dose,score,ylim=c(0,4),col=c((type == "B")*1 + (type == "A")*8),
##D      main="Type B");abline(h=c(0,4),lty=2)
##D lines(seqq,ddB[,1],lwd=2,col=2)
##D lines(seqq,ddB[,2],lwd=1,col=4)
##D lines(seqq,ddB[,3],lwd=2,col=1)
##D lines(seqq,ddB[,4],lwd=1,col=4)
##D lines(seqq,ddB[,5],lwd=2,col=2)
## End(Not run)



