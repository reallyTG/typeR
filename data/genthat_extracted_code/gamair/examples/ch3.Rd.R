library(gamair)


### Name: ch3
### Title: Code for Chapter 3: Generalized Linear Models
### Aliases: ch3

### ** Examples

library(gamair); library(mgcv)

## 3.2.2
x <- c(.6,1.5); y <- c(.02,.9)
ms <- exp(-x*4)   # set initial values at lower left
glm(y ~ I(-x)-1,family=gaussian(link=log),mustart=ms)
ms <- exp(-x*0.1)  # set initial values at upper right
glm(y ~ I(-x)-1,family=gaussian(link=log),mustart=ms)

## 3.3.1

heart <- data.frame(ck = 0:11*40+20,
ha=c(2,13,30,30,21,19,18,13,19,15,7,8),
ok=c(88,26,8,5,0,1,1,1,1,0,0,0))

p <- heart$ha/(heart$ha+heart$ok)
plot(heart$ck,p,xlab="Creatinine kinase level",
     ylab="Proportion Heart Attack")
mod.0 <- glm(cbind(ha,ok) ~ ck, family=binomial(link=logit),
             data=heart)
mod.0 <- glm(cbind(ha,ok) ~ ck, family=binomial, data=heart)
mod.0
(271.7-36.93)/271.7
1-pchisq(36.93,10)
par(mfrow=c(2,2))
plot(mod.0)
plot(heart$ck, p, xlab="Creatinine kinase level",
     ylab="Proportion Heart Attack")
lines(heart$ck, fitted(mod.0))
mod.2 <- glm(cbind(ha,ok)~ck+I(ck^2)+I(ck^3),family=binomial,
             data=heart)
mod.2
par(mfrow=c(2,2))
plot(mod.2)
par(mfrow=c(1,1))
plot(heart$ck,p,xlab="Creatinine kinase level",
     ylab="Proportion Heart Attack")
lines(heart$ck,fitted(mod.2))
anova(mod.0,mod.2,test="Chisq")

## 3.3.2
y <- c(12,14,33,50,67,74,123,141,165,204,253,246,240)
t <- 1:13
plot(t+1980,y,xlab="Year",ylab="New AIDS cases",ylim=c(0,280))
m0 <- glm(y~t,poisson)
m0
par(mfrow=c(2,2))
plot(m0)
m1 <- glm(y~t+I(t^2),poisson)
plot(m1)
summary(m1)
anova(m0,m1,test="Chisq")
beta.1 <- summary(m1)$coefficients[2,]
ci <- c(beta.1[1]-1.96*beta.1[2],beta.1[1]+1.96*beta.1[2])
ci ## print 95% CI for beta_1
new.t <- seq(1,13,length=100)
fv <- predict(m1,data.frame(t=new.t),se=TRUE)
par(mfrow=c(1,1))
plot(t+1980,y,xlab="Year",ylab="New AIDS cases",ylim=c(0,280))
lines(new.t+1980,exp(fv$fit))
lines(new.t+1980,exp(fv$fit+2*fv$se.fit),lty=2)
lines(new.t+1980,exp(fv$fit-2*fv$se.fit),lty=2)

## 3.3.3
psurv <- function(surv,time="t",censor="d",event="z") {
## create data frame to fit Cox PH as Poisson model.
## surv[[censor]] should be 1 for event or zero for censored.   
  if (event %in% names(surv)) warning("event name clashes")
  surv <- as.data.frame(surv)[order(surv[[time]]),] # t order
  et <- unique(surv[[time]][surv[[censor]]==1]) # unique times 
  es <- match(et,surv[[time]]) # starts of risk sets in surv
  n <- nrow(surv); t <- rep(et,1+n-es) # times for risk sets
  st <- cbind(0,
     surv[unlist(apply(matrix(es),1,function(x,n) x:n,n=n)),])
  st[st[[time]]==t&st[[censor]]!=0,1] <- 1 # signal events 
  st[[time]] <- t ## reset event time to risk set time
  names(st)[1] <- event
  st
} ## psurv

require(gamair); data(bone); bone$id <- 1:nrow(bone)
pb <- psurv(bone); pb$tf <- factor(pb$t)
b <- glm(z ~ tf + trt - 1,poisson,pb)

chaz <- tapply(fitted(b),pb$id,sum) ## by subject cum. hazard
mrsd <- bone$d - chaz ## Martingale residuals

drop1(b,test="Chisq") ## test for effect - no evidence

te <- sort(unique(bone$t[bone$d==1])) ## event times
## predict survivor function for "allo"...
pd <- data.frame(tf=factor(te),trt=bone$trt[1])
fv <- predict(b,pd)
H <- cumsum(exp(fv)) ## cumulative hazard
plot(stepfun(te,c(1,exp(-H))),do.points=FALSE,ylim=c(0,1),
     xlim=c(0,550),main="",ylab="S(t)",xlab="t (days)")
## add s.e. bands...     
X <- model.matrix(~tf+trt-1,pd)
J <- apply(exp(fv)*X,2,cumsum)
se <- diag(J%*%vcov(b)%*%t(J))^.5
lines(stepfun(te,c(1,exp(-H+se))),do.points=FALSE,lty=2)
lines(stepfun(te,c(1,exp(-H-se))),do.points=FALSE,lty=2)

## 3.3.4
al <- data.frame(y=c(435,147,375,134),gender=
   as.factor(c("F","F","M","M")),faith=as.factor(c(1,0,1,0)))
al
mod.0 <- glm(y ~ gender + faith, data=al, family=poisson)
model.matrix(mod.0)
mod.0
fitted(mod.0)
mod.1 <- glm(y~gender*faith,data=al,family=poisson)
model.matrix(mod.1)
mod.1
anova(mod.0,mod.1,test="Chisq")

## 3.3.5
data(sole)
sole$off <- log(sole$a.1-sole$a.0)# model offset term
sole$a<-(sole$a.1+sole$a.0)/2     # mean stage age
solr<-sole                        # make copy for rescaling
solr$t<-solr$t-mean(sole$t)
solr$t<-solr$t/var(sole$t)^0.5
solr$la<-solr$la-mean(sole$la)
solr$lo<-solr$lo-mean(sole$lo)
b <- glm(eggs ~ offset(off)+lo+la+t+I(lo*la)+I(lo^2)+I(la^2)
          +I(t^2)+I(lo*t)+I(la*t)+I(lo^3)+I(la^3)+I(t^3)+
          I(lo*la*t)+I(lo^2*la)+I(lo*la^2)+I(lo^2*t)+
          I(la^2*t)+I(la*t^2)+I(lo*t^2)+ a +I(a*t)+I(t^2*a),
          family=quasi(link=log,variance="mu"),data=solr)
summary(b)
b1 <- update(b, ~ . - I(lo*t))
b4 <- update(b1, ~ . - I(lo*la*t) - I(lo*t^2) - I(lo^2*t))
anova(b,b4,test="F")
par(mfrow=c(1,2)) # split graph window into 2 panels
plot(fitted(b4)^0.5,solr$eggs^0.5) # fitted vs. data plot
plot(fitted(b4)^0.5,residuals(b4)) # resids vs. sqrt(fitted)

## 3.5.1
rf <- residuals(b4,type="d") # extract deviance residuals
## create an identifier for each sampling station
solr$station <- factor(with(solr,paste(-la,-lo,-t,sep="")))
## is there evidence of a station effect in the residuals?
solr$rf <-rf
rm <- lme(rf~1,solr,random=~1|station)
rm0 <- lm(rf~1,solr)
anova(rm,rm0)
## following is slow...
## Not run: 
##D library(MASS)
##D form <- eggs ~ offset(off)+lo+la+t+I(lo*la)+I(lo^2)+
##D             I(la^2)+I(t^2)+I(lo*t)+I(la*t)+I(lo^3)+I(la^3)+
##D             I(t^3)+I(lo*la*t)+I(lo^2*la)+I(lo*la^2)+I(lo^2*t)+
##D             I(la^2*t)+I(la*t^2)+I(lo*t^2)+ # end log spawn
##D             a +I(a*t)+I(t^2*a)
##D b <- glmmPQL(form,random=list(station=~1),
##D             family=quasi(link=log,variance="mu"),data=solr)
##D 
##D summary(b)
##D 
##D form4 <- eggs ~ offset(off)+lo+la+t+I(lo*la)+I(lo^2)+
##D             I(la^2)+I(t^2)+I(lo*t)+I(la*t)+I(lo^3)+I(la^3)+
##D             I(t^3)+I(lo^2*la)+I(lo*la^2)+
##D             I(la^2*t)+I(lo*t^2)+ # end log spawn
##D             a +I(a*t)+I(t^2*a)
##D 
##D b4 <- glmmPQL(form4,random=list(station=~1),
##D             family=quasi(link=log,variance="mu"),data=solr)
##D 
##D fv <- exp(fitted(b4)+solr$off) # note need to add offset
##D resid <- solr$egg-fv          # raw residuals
##D plot(fv^.5,solr$eggs^.5)
##D abline(0,1,lwd=2)
##D plot(fv^.5,resid/fv^.5)
##D plot(fv^.5,resid)
##D fl<-sort(fv^.5)
##D ## add 1 s.d. and 2 s.d. reference lines
##D lines(fl,fl);lines(fl,-fl);lines(fl,2*fl,lty=2)
##D lines(fl,-2*fl,lty=2)
##D 
##D intervals(b4,which="var-cov")
##D 
##D ## 3.5.2
##D b <- gam(form,family=quasi(link=log,variance="mu"),data=solr,
##D          method="REML")
##D 
##D ## 3.5.3
##D library(lme4)
##D solr$egg1 <- round(solr$egg * 5)
##D form <- egg1 ~ offset(off)+lo+la+t+I(lo*la)+I(lo^2)+
##D             I(la^2)+I(t^2)+I(lo*t)+I(la*t)+I(lo^3)+I(la^3)+
##D             I(t^3)+I(lo*la*t)+I(lo^2*la)+I(lo*la^2)+I(lo^2*t)+
##D             I(la^2*t)+I(la*t^2)+I(lo*t^2)+ # end log spawn
##D             a +I(a*t)+I(t^2*a) + (1|station)
##D 
##D glmer(form,family=poisson,data=solr)
## End(Not run)



