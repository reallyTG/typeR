library(lava)


### Name: eventTime
### Title: Add an observed event time outcome to a latent variable model.
### Aliases: eventTime eventTime<-
### Keywords: models regression survival

### ** Examples


# Right censored survival data without covariates
m0 <- lvm()
distribution(m0,"eventtime") <- coxWeibull.lvm(scale=1/100,shape=2)
distribution(m0,"censtime") <- coxExponential.lvm(rate=10)
m0 <- eventTime(m0,time~min(eventtime=1,censtime=0),"status")
sim(m0,10)

# Alternative specification of the right censored survival outcome
## eventTime(m,"Status") <- ~min(eventtime=1,censtime=0)

# Cox regression:
# lava implements two different parametrizations of the same
# Weibull regression model. The first specifies
# the effects of covariates as proportional hazard ratios
# and works as follows:
m <- lvm()
distribution(m,"eventtime") <- coxWeibull.lvm(scale=1/100,shape=2)
distribution(m,"censtime") <- coxWeibull.lvm(scale=1/100,shape=2)
m <- eventTime(m,time~min(eventtime=1,censtime=0),"status")
distribution(m,"sex") <- binomial.lvm(p=0.4)
distribution(m,"sbp") <- normal.lvm(mean=120,sd=20)
regression(m,from="sex",to="eventtime") <- 0.4
regression(m,from="sbp",to="eventtime") <- -0.01
sim(m,6)
# The parameters can be recovered using a Cox regression
# routine or a Weibull regression model. E.g.,
## Not run: 
##D     set.seed(18)
##D     d <- sim(m,1000)
##D     library(survival)
##D     coxph(Surv(time,status)~sex+sbp,data=d)
##D 
##D     sr <- survreg(Surv(time,status)~sex+sbp,data=d)
##D     library(SurvRegCensCov)
##D     ConvertWeibull(sr)
##D 
## End(Not run)

# The second parametrization is an accelerated failure time
# regression model and uses the function weibull.lvm instead
# of coxWeibull.lvm to specify the event time distributions.
# Here is an example:

ma <- lvm()
distribution(ma,"eventtime") <- weibull.lvm(scale=3,shape=0.7)
distribution(ma,"censtime") <- weibull.lvm(scale=2,shape=0.7)
ma <- eventTime(ma,time~min(eventtime=1,censtime=0),"status")
distribution(ma,"sex") <- binomial.lvm(p=0.4)
distribution(ma,"sbp") <- normal.lvm(mean=120,sd=20)
regression(ma,from="sex",to="eventtime") <- 0.7
regression(ma,from="sbp",to="eventtime") <- -0.008
set.seed(17)
sim(ma,6)
# The regression coefficients of the AFT model
# can be tranformed into log(hazard ratios):
#  coef.coxWeibull = - coef.weibull / shape.weibull
## Not run: 
##D     set.seed(17)
##D     da <- sim(ma,1000)
##D     library(survival)
##D     fa <- coxph(Surv(time,status)~sex+sbp,data=da)
##D     coef(fa)
##D     c(0.7,-0.008)/0.7
## End(Not run)


# The Weibull parameters are related as follows:
# shape.coxWeibull = 1/shape.weibull
# scale.coxWeibull = exp(-scale.weibull/shape.weibull)
# scale.AFT = log(scale.coxWeibull) / shape.coxWeibull
# Thus, the following are equivalent parametrizations
# which produce exactly the same random numbers:

model.aft <- lvm()
distribution(model.aft,"eventtime") <- weibull.lvm(scale=-log(1/100)/2,shape=0.5)
distribution(model.aft,"censtime") <- weibull.lvm(scale=-log(1/100)/2,shape=0.5)
set.seed(17)
sim(model.aft,6)

model.cox <- lvm()
distribution(model.cox,"eventtime") <- coxWeibull.lvm(scale=1/100,shape=2)
distribution(model.cox,"censtime") <- coxWeibull.lvm(scale=1/100,shape=2)
set.seed(17)
sim(model.cox,6)

# The minimum of multiple latent times one of them still
# being a censoring time, yield
# right censored competing risks data

mc <- lvm()
distribution(mc,~X2) <- binomial.lvm()
regression(mc) <- T1~f(X1,-.5)+f(X2,0.3)
regression(mc) <- T2~f(X2,0.6)
distribution(mc,~T1) <- coxWeibull.lvm(scale=1/100)
distribution(mc,~T2) <- coxWeibull.lvm(scale=1/100)
distribution(mc,~C) <- coxWeibull.lvm(scale=1/100)
mc <- eventTime(mc,time~min(T1=1,T2=2,C=0),"event")
sim(mc,6)





