library(timereg)


### Name: wald.test
### Title: Makes wald test
### Aliases: wald.test
### Keywords: survival

### ** Examples


data(sTRACE)
# Fits Cox model 
out<-cox.aalen(Surv(time,status==9)~prop(age)+prop(sex)+
prop(vf)+prop(chf)+prop(diabetes),data=sTRACE,n.sim=0)

wald.test(out,coef.null=c(1,2,3))
### test age=sex   vf=chf
wald.test(out,contrast=rbind(c(1,-1,0,0,0),c(0,0,1,-1,0)))

### now same with direct specifation of estimates and variance
wald.test(coef=out$gamma,Sigma=out$var.gamma,coef.null=c(1,2,3))
wald.test(coef=out$gamma,Sigma=out$robvar.gamma,coef.null=c(1,2,3))
### test age=sex   vf=chf
wald.test(coef=out$gamma,Sigma=out$var.gamma,
	  contrast=rbind(c(1,-1,0,0,0),c(0,0,1,-1,0)))




