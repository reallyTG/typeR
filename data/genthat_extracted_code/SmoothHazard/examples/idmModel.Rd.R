library(SmoothHazard)


### Name: idmModel
### Title: Generate illness-death model objects
### Aliases: idmModel

### ** Examples

## Not run: 
##D library(lava)
##D library(prodlim)
##D # generate illness-death model based on exponentially
##D # distributed times
##D m <- idmModel(scale.illtime=1/70,
##D               shape.illtime=1.8,
##D               scale.lifetime=1/50,
##D               shape.lifetime=0.7,
##D               scale.waittime=1/30,
##D               shape.waittime=0.7)
##D round(sim(m,6),1)
##D 
##D # Estimate the parameters of the Weibull models
##D # based on the uncensored exact event times
##D # and the uncensored illstatus.
##D set.seed(18)
##D d <- sim(m,100,latent=FALSE)
##D d$uncensored.status <- 1
##D f <- idm(formula01=Hist(time=illtime,event=illstatus)~1,
##D          formula02=Hist(time=lifetime,event=uncensored.status)~1,
##D          data=d,
##D          conf.int=FALSE)
##D print(f)
##D 
##D # Change the rate of the 0->2 and 0->1 transitions
##D # also the rate of the 1->2 transition
##D # and also lower the censoring rate
##D m <- idmModel(scale.lifetime=1/2000,
##D               scale.waittime=1/30,
##D               scale.illtime=1/1000,
##D               scale.censtime=1/1000)
##D set.seed(18)
##D d <- sim(m,50,latent=TRUE)
##D d$uncensored.status <- 1
##D 
##D f <- idm(formula01=Hist(time=observed.illtime,event=illstatus)~1,
##D          formula02=Hist(time=observed.lifetime,event=uncensored.status)~1,
##D          data=d,
##D          conf.int=FALSE)
##D print(f)
##D 
##D # Estimate based on the right censored observations
##D fc <- idm(formula01=Hist(time=illtime,event=seen.ill)~1,
##D           formula02=Hist(time=observed.lifetime,event=seen.exit)~1,
##D           data=d,
##D           conf.int=FALSE)
##D print(fc)
##D 
##D # Estimate based on interval censored and right censored observations
##D fi <- idm(formula01=Hist(time=list(L,R),event=seen.ill)~1,
##D           formula02=Hist(time=observed.lifetime,event=seen.exit)~1,
##D           data=d,
##D           conf.int=FALSE)
##D print(fi)
##D 
##D # Estimation of covariate effects:
##D # X1, X2, X3
##D m <- idmModel(shape.waittime=2,
##D               scale.lifetime=1/2000,
##D               scale.waittime=1/300,
##D               scale.illtime=1/10000,
##D               scale.censtime=1/10000)
##D distribution(m,"X1") <- binomial.lvm(p=0.3)
##D distribution(m,"X2") <- normal.lvm(mean=120,sd=20)
##D distribution(m,"X3") <- normal.lvm(mean=50,sd=20)
##D regression(m,to="latent.illtime",from="X1") <- 1.7
##D regression(m,to="latent.illtime",from="X2") <- 0.07
##D regression(m,to="latent.illtime",from="X3") <- -0.1
##D regression(m,to="latent.waittime",from="X1") <- 1.8
##D regression(m,to="latent.lifetime",from="X1") <- 0.7
##D set.seed(28)
##D d <- sim(m,100,latent=TRUE)
##D head(d)
##D table(ill=d$seen.ill,death=d$seen.exit)
##D 
##D # Estimation based on uncensored data
##D d$uncensored.status <- 1
##D # uncensored data
##D F1 <- idm(formula01=Hist(time=illtime,event=illstatus)~X1+X2+X3,
##D           formula02=Hist(time=lifetime,event=uncensored.status)~X1+X2+X3,
##D           data=d,conf.int=FALSE)
##D print(F1)
##D 
##D # Estimation based on right censored data
##D F2 <- idm(formula01=Hist(time=illtime,event=seen.ill)~X1+X2+X3,
##D           formula02=Hist(time=observed.lifetime,event=seen.exit)~X1+X2+X3,
##D           data=d,conf.int=FALSE)
##D print(F2)
##D 
##D # Estimation based on interval censored and right censored data
##D F3 <- idm(formula01=Hist(time=list(L,R),event=seen.ill)~X1+X2+X3,
##D           formula02=Hist(time=observed.lifetime,event=seen.exit)~X1+X2+X3,
##D           data=d,conf.int=FALSE)
##D print(F3)
##D cbind(uncensored=F1$coef,right.censored=F2$coef,interval.censored=F3$coef)
## End(Not run)



