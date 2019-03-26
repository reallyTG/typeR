library(timereg)


### Name: cum.residuals
### Title: Model validation based on cumulative residuals
### Aliases: cum.residuals
### Keywords: survival

### ** Examples


data(sTRACE)
# Fits Aalen model and returns residuals
fit<-aalen(Surv(time,status==9)~age+sex+diabetes+chf+vf,
           data=sTRACE,max.time=7,n.sim=0,residuals=1)

# constructs and simulates cumulative residuals versus age groups
fit.mg<-cum.residuals(fit,data=sTRACE,n.sim=100,
modelmatrix=model.matrix(~-1+factor(cut(age,4)),sTRACE))

par(mfrow=c(1,4))
# cumulative residuals with confidence intervals
plot(fit.mg);
# cumulative residuals versus processes under model
plot(fit.mg,score=1); 
summary(fit.mg)

# cumulative residuals vs. covariates Lin, Wei, Ying style 
fit.mg<-cum.residuals(fit,data=sTRACE,cum.resid=1,n.sim=100)

par(mfrow=c(2,4))
plot(fit.mg,score=2)
summary(fit.mg)




