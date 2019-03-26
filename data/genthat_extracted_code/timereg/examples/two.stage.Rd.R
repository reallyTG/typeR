library(timereg)


### Name: two.stage
### Title: Fit Clayton-Oakes-Glidden Two-Stage model
### Aliases: two.stage
### Keywords: survival

### ** Examples


library(timereg)
data(diabetes)
# Marginal Cox model  with treat as covariate
marg <- cox.aalen(Surv(time,status)~prop(treat)+prop(adult)+
	  cluster(id),data=diabetes,resample.iid=1)
fit<-two.stage(marg,data=diabetes,theta=1.0,Nit=40)
summary(fit)

# using coxph and giving clusters, but SE wittout cox uncetainty
margph <- coxph(Surv(time,status)~treat,data=diabetes)
fit<-two.stage(margph,data=diabetes,theta=1.0,Nit=40,clusters=diabetes$id)


# Stratification after adult 
theta.des<-model.matrix(~-1+factor(adult),diabetes);
des.t<-model.matrix(~-1+factor(treat),diabetes);
design.treat<-cbind(des.t[,-1]*(diabetes$adult==1),
                    des.t[,-1]*(diabetes$adult==2))

# test for common baselines included here 
marg1<-cox.aalen(Surv(time,status)~-1+factor(adult)+prop(design.treat)+cluster(id),
 data=diabetes,resample.iid=1,Nit=50)

fit.s<-two.stage(marg1,data=diabetes,Nit=40,theta=1,theta.des=theta.des)
summary(fit.s)

# with common baselines  and common treatment effect (although test reject this)
fit.s2<-two.stage(marg,data=diabetes,Nit=40,theta=1,theta.des=theta.des)
summary(fit.s2)

# test for same variance among the two strata
theta.des<-model.matrix(~factor(adult),diabetes);
fit.s3<-two.stage(marg,data=diabetes,Nit=40,theta=1,theta.des=theta.des)
summary(fit.s3)

# to fit model without covariates, use beta.fixed=1 and prop or aalen function
marg <- aalen(Surv(time,status)~+1+cluster(id),
	 data=diabetes,resample.iid=1,n.sim=0)
fita<-two.stage(marg,data=diabetes,theta=0.95,detail=0)
summary(fita)

# same model but se's without variation from marginal model to speed up computations
marg <- aalen(Surv(time,status) ~+1+cluster(id),data=diabetes,
	      resample.iid=0,n.sim=0)
fit<-two.stage(marg,data=diabetes,theta=0.95,detail=0)
summary(fit)

# same model but se's now with fewer time-points for approx of iid decomp of marginal 
# model to speed up computations
marg <- cox.aalen(Surv(time,status) ~+prop(treat)+cluster(id),data=diabetes,
	      resample.iid=1,n.sim=0,max.timepoint.sim=5,beta.fixed=1,beta=0)
fit<-two.stage(marg,data=diabetes,theta=0.95,detail=0)
summary(fit)




