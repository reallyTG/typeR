library(pssm)


### Name: pssm
### Title: Fits a joint piecewise exponential model for progression and
###   survival
### Aliases: pssm
### Keywords: package survival interval censoring progression free survival

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
#generate data
set.seed(359)
u<-pssm.generate.data(theta1=.5,theta2=0,phaz.progression=rep(log(-log(.3)/4),5),	
phaz.survival=rep(log(-log(.2)/4),15),accrual=2,followup=2.9,m=5,n=100,times=c(.8,2.1,3.4))
#estimate based on joint model
ps<-pssm(surv(tprog0,tprog1)~rx,surv(tdeath,cdeath)~rx,u,intervals=3,rescale=1)
summary(ps)
plot(ps,type='survival',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))
plot(ps)
plot(ps,type='progression',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))
#estimate time to progression only (tumor free survival)
ps1=pssm(surv(tprog0,tprog1)~rx,NULL,u,intervals=3,rescale=1)
summary(ps1)
plot(ps1)
plot(ps1,type='progression',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))
#estimate survival only
ps2=pssm(NULL,surv(tdeath,cdeath)~rx,u,intervals=3,rescale=1)
summary(ps2)
plot(ps2)
plot(ps2,type='survival',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))



