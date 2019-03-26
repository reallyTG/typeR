library(pssm)


### Name: pssm.survivalcurv
### Title: time to progression and time to death function for a "pssm"
###   object
### Aliases: pssm.survivalcurv
### Keywords: survival interval censoring progression free survival

### ** Examples

#generate data for plot
u<-pssm.generate.data(theta1=.5,theta2=0,phaz.progression=rep(log(-log(.3)/4),5),	
    phaz.survival=rep(log(-log(.15)/4),15),accrual=2,followup=2.9,m=5,
    n=50,times=c(1,2,3),delta=0.5)
#estimate parameters
ps<-pssm(surv(tprog0,tprog1)~rx,surv(tdeath,cdeath)~rx,dat=u,intervals=3)
#calculate survival curves
vs<-pssm.survivalcurv(ps,cov1=matrix(c(0,1),2,1),cov2=matrix(c(0,1),2,1),covariance=TRUE)
t=c(0,2,4,4.99)
curves=vs(t)
#plot survival curves
plot(t,curves$estimate[curves$rx==0],type='l',lty=2,ylim=c(0,1),
     main='Survival Curve',xlab='Time',ylab='Probability of Survival')
points(t,curves$estimate[curves$rx==1],type='l',lty=1,xlim=c(0,5))



