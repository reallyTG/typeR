library(TrialSize)


### Name: Dose.Response.time.to.event
### Title: Linear Contrast Test for Time-to-Event Endpoint in dose response
###   study
### Aliases: Dose.Response.time.to.event
### Keywords: ~kwd1 ~kwd2

### ** Examples



Ti=c(14,20,22,24);
ci=c(-6,1,2,3);

Example.11.3.1<-Dose.Response.time.to.event(alpha=0.05,beta=0.2,T0=9,T=16,Ti=Ti,ci=ci,fi=1/4)
Example.11.3.1
#412

fi1=c(1/9,2/9,2/9,2/9);
Example.11.3.2<-Dose.Response.time.to.event(alpha=0.05,beta=0.2,T0=9,T=16,Ti=Ti,ci=ci,fi=fi1)
Example.11.3.2
#814

fi2=c(1/2.919,0.711/2.919,0.634/2.919,0.574/2.919);
Example.11.3.3<-Dose.Response.time.to.event(alpha=0.05,beta=0.2,T0=9,T=16,Ti=Ti,ci=ci,fi=fi2)
Example.11.3.3
#349




