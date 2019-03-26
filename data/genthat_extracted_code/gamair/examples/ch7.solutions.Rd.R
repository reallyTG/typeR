library(gamair)


### Name: ch7.solutions
### Title: Solution code for Chapter 7 GAMs in Practice: mgcv
### Aliases: ch7.solutions

### ** Examples

library(gamair); library(mgcv)

## Q.1
## a)
data(hubble)
h1 <- gam(y~s(x),data=hubble)
plot(h1) ## model is curved
h0 <- gam(y~x,data=hubble)
h1;h0
AIC(h1,h0)

## b)
gam.check(h1) # oh dear
h2 <- gam(y~s(x),data=hubble,family=quasi(var=mu))
gam.check(h2) # not great, but better
h2

## Q.2
## a)
library(MASS)
par(mfrow=c(2,2))
mc <- gam(accel~s(times,k=40),data=mcycle)
plot(mc,residuals=TRUE,se=FALSE,pch=1)

## b)
mc1 <- lm(accel~poly(times,11),data=mcycle)
termplot(mc1,partial.resid=TRUE)

## c)
mc2 <- gam(accel~s(times,k=11,fx=TRUE),data=mcycle)
plot(mc2,residuals=TRUE,se=FALSE,pch=1)

## d)
mc3 <- gam(accel~s(times,k=11,fx=TRUE,bs="cr"),data=mcycle)
plot(mc3,residuals=TRUE,se=FALSE,pch=1)

## e)
par(mfrow=c(1,1))
plot(mcycle$times,residuals(mc))

## f)
mcw <- gam(accel~s(times,k=40),data=mcycle,
           weights=c(rep(400,20),rep(1,113)))
plot(mcw,residuals=TRUE,pch=1)
rsd <- residuals(mcw)
plot(mcycle$times,rsd)
var(rsd[21:133])/var(rsd[1:20])

## g)
gam(accel~s(times,k=40,m=3),data=mcycle,
    weights=c(rep(400,20),rep(1,113)))

## Q.3
## b)
library(MASS)
n <- nrow(mcycle)
A <- matrix(0,n,n)
for (i in 1:n) {
  mcycle$y<-mcycle$accel*0;mcycle$y[i] <- 1
  A[,i] <- fitted(gam(y~s(times,k=40),data=mcycle,sp=mc$sp))
}

## d)
plot(mcycle$times,A[,65],type="l",ylim=c(-0.05,0.15))

## e)
for (i in 1:n) lines(mcycle$times,A[,i])

## f)
par(mfrow=c(2,2))
mcycle$y<-mcycle$accel*0;mcycle$y[65] <- 1
for (k in 1:4) plot(mcycle$times,fitted(
     gam(y~s(times,k=40),data=mcycle,sp=mc$sp*10^(k-1.5))
     ),type="l",ylab="A[65,]",ylim=c(-0.01,0.12))

## Q.4
## a)
par(mfrow=c(1,1))
w <- c(rep(400,20),rep(1,113))
m <- 40;par(mfrow=c(1,1))
sp <- seq(-13,12,length=m) ## trial log(sp)'s
AC1 <- EDF <- rep(0,m)
for (i in 1:m) { ## loop through s.p.'s
 b <- gam(accel~s(times,k=40),data=mcycle,weights=w,
          sp=exp(sp[i]))
 EDF[i] <- sum(b$edf)
 AC1[i] <- acf(residuals(b),plot=FALSE)$acf[2]
}
plot(EDF,AC1,type="l");abline(0,0,col=2)

## Not run: 
##D ## Q.5 - a bit slow - few seconds
##D ## a)
##D data(co2s)
##D attach(co2s)
##D plot(c.month,co2,type="l")
##D 
##D ## b)
##D b<-gam(co2~s(c.month,k=300,bs="cr"))
##D 
##D ## c)
##D pd <- data.frame(c.month=1:(n+36))
##D fv <- predict(b,pd,se=TRUE)
##D plot(pd$c.month,fv$fit,type="l")
##D lines(pd$c.month,fv$fit+2*fv$se,col=2)
##D lines(pd$c.month,fv$fit-2*fv$se,col=2)
##D 
##D ## d)
##D b2 <- gam(co2~s(month,bs="cc")+s(c.month,bs="cr",k=300),
##D            knots=list(month=seq(1,13,length=10)))
##D 
##D ## e)
##D pd2 <- data.frame(c.month=1:(n+36),
##D                   month=rep(1:12,length.out=n+36))
##D fv <- predict(b2,pd2,se=TRUE)
##D plot(pd$c.month,fv$fit,type="l")
##D lines(pd$c.month,fv$fit+2*fv$se,col=2)
##D lines(pd$c.month,fv$fit-2*fv$se,col=2)
## End(Not run)

## Not run: 
##D ## Q.6 - a bit slow - a few seconds
##D data(ipo)
##D n<-nrow(ipo)
##D ## create lagged variables ...
##D ipo$ir1 <- c(NA,ipo$ir[1:(n-1)])
##D ipo$ir2 <- c(NA,NA,ipo$ir[1:(n-2)])
##D ipo$ir3 <- c(NA,NA,NA,ipo$ir[1:(n-3)])
##D ipo$ir4 <- c(NA,NA,NA,NA,ipo$ir[1:(n-4)])
##D ipo$dp1 <- c(NA,ipo$dp[1:(n-1)])
##D ipo$dp2 <- c(NA,NA,ipo$dp[1:(n-2)])
##D ipo$dp3 <- c(NA,NA,NA,ipo$dp[1:(n-3)])
##D ipo$dp4 <- c(NA,NA,NA,NA,ipo$dp[1:(n-4)])
##D ## fit initial model and look at it ...
##D b<-gam(n.ipo~s(ir1)+s(ir2)+s(ir3)+s(ir4)+s(log(reg.t))+
##D    s(dp1)+s(dp2)+s(dp3)+s(dp4)+s(month,bs="cc")+s(t,k=20),
##D    data=ipo,knots=list(month=seq(1,13,length=10)),
##D    family=poisson,gamma=1.4)
##D par(mfrow=c(3,4))
##D plot(b,scale=0)
##D summary(b)
##D ## re-fit model dropping ir4 ...
##D b1 <- gam(n.ipo~s(ir1)+s(ir2)+s(ir3)+s(log(reg.t))+s(dp1)+
##D           s(dp2)+s(dp3)+s(dp4)+s(month,bs="cc")+s(t,k=20),
##D           data=ipo,knots=list(month=seq(1,13,length=10)),
##D           family=poisson,gamma=1.4)
##D par(mfrow=c(3,4))
##D plot(b1,scale=0)
##D summary(b1)
##D ## residual checking ...
##D gam.check(b1)
##D par(mfrow=c(1,1))
##D acf(residuals(b1))
## End(Not run)

## Q.7
data(wine)
wm<-gam(price~s(h.rain)+s(s.temp)+s(h.temp)+s(year),
    data=wine,family=Gamma(link=identity),gamma=1.4)
plot(wm,pages=1,residuals=TRUE,pch=1,scale=0)
acf(residuals(wm))
gam.check(wm)
predict(wm,wine,se=TRUE)

## Q.8
## a)
par(mfrow=c(1,1))
data(blowfly)
bf <- blowfly
plot(bf$day,bf$pop,type="l")

## b)
## prepare differenced and lagged data ...
n <- nrow(bf)
bf$dn <- c(NA,bf$pop[2:n]-bf$pop[1:(n-1)])
lag <- 6
bf$n.lag <- c(rep(NA,lag),bf$pop[1:(n-lag)])
bf1 <- bf[(lag+1):n,] # strip out NAs, for convenience
## fit model, note no intercept ...
b<-gam(dn~n.lag+pop+s(log(n.lag),by=n.lag)+
       s(log(pop),by=-pop)-1,data=bf1)
plot(b,pages=1,scale=-1,se=FALSE) ## effects
plot(abs(fitted(b)),residuals(b))
acf(residuals(b))

## c)
fv <- bf$pop
e <- rnorm(n)*0 ## increase multiplier for noisy version
min.pop <- min(bf$pop);max.pop <- max(bf$pop)
for (i in (lag+1):n) { ## iteration loop
  dn <- predict(b,data.frame(n.lag=fv[i-lag],pop=fv[i-1]))
  fv[i] <- fv[i-1]+dn + e[i];
  fv[i]<-min(max.pop,max(min.pop,fv[i]))
}
plot(bf$day,fv,type="l")

## Not run: 
##D ## Q.9 - takes several minutes
##D ## a)
##D data(chl)
##D pairs(chl,pch=".")
##D 
##D ## b)
##D fam <- quasi(link=log,var=mu^2)
##D cm <- gam(chl ~ s(I(chl.sw^.4),bs="cr",k=20)+
##D       s(I(bath^.25),bs="cr",k=60)+s(jul.day,bs="cr",k=20),
##D       data=chl,family=fam,gamma=1.4)
##D gam.check(cm)
##D summary(cm)
##D 
##D ## c)
##D ## create fit and validation sets ...
##D set.seed(2)
##D n<-nrow(chl);nf <- floor(n*.9)
##D ind <- sample(1:n,nf,replace=FALSE)
##D chlf <- chl[ind,];chlv <- chl[-ind,]
##D ## fit to the fit set
##D cmf<-gam(chl ~ s(I(chl.sw^.4),bs="cr",k=20)+
##D      s(I(bath^.25),bs="cr",k=60)+s(jul.day,bs="cr",k=20),
##D      data=chlf,family=fam,gamma=1.4)
##D ## evaluate prop. dev. explained for validation set
##D y <- chlv$chl;w <- y*0+1
##D mu <- predict(cmf,chlv,type="response")
##D pred.dev <- sum(fam$dev.resids(y,mu,w))
##D null.dev <- sum(fam$dev.resids(y,mean(y),w))
##D 1-pred.dev/null.dev # prop dev. explained
## End(Not run)

## Not run: 
##D ## Q.10 - a few seconds run time
##D ## a)
##D g1<-gamm(weight ~ Variety + s(Time)+
##D     s(Time,by=ordered(Variety)),data=Soybean,
##D     family=Gamma(link=log), random=list(Plot=~Time))
##D plot(g1$lme) ## standard mean variance plot
##D par(mfrow=c(1,3))
##D plot(g1$gam,residuals=TRUE,all.terms=TRUE,scale=0) ## gam plot
##D 
##D ## b)
##D summary(g1$gam) ## evidence for variety dependence
##D ## could also do following ....
##D g2 <- gamm(weight~s(Time),family=Gamma(link=log),
##D       data=Soybean,random=list(Plot=~Time))
##D g3 <- gamm(weight~Variety+s(Time),family=Gamma(link=log),
##D       data=Soybean,random=list(Plot=~Time))
##D ## following only a rough guide, but also supports g1 ...
##D AIC(g1$lme,g2$lme,g3$lme)
##D 
##D ## Q.11
##D data(med); head(med) ## look at data
##D 
##D ## initial plots...
##D plot(med$lo,med$la,cex=0.2+med$count^.5/10,col="grey",
##D      pch=19,xlab="lo",ylab="la",main="mackerel")
##D ind <- med$count==0
##D points(med$lo[ind],med$la[ind],cex=0.1,pch=19)
##D lines(coast)
##D ## ... survey seems to cover spawning area this time!
##D 
##D require(mgcv)
##D m1 <- gam(count~s(lo,la,k=100)+s(T.surf)+s(T.20)+s(I(b.depth^.5))+s(Sal20)+
##D           s(ship,bs="re")+offset(log(vol)),data=med,select=TRUE,family=tw)
##D gam.check(m1) ## mean variance relationship not quite right?
##D 
##D m2 <- gam(count~s(lo,la,k=100)+s(T.surf)+s(T.20)+s(I(b.depth^.5))+s(Sal20)+
##D           s(ship,bs="re")+offset(log(vol)),data=med,select=TRUE,family=nb)
##D gam.check(m2)
##D 
##D par(mfrow=c(1,2)) ## re-check residuals vs fitted
##D plot(fitted(m1)^.5,residuals(m1));plot(fitted(m2)^.5,residuals(m2))
##D 
##D AIC(m1,m2) ## neg bin much better
##D plot(m2,pages=1) ## effects
##D 
## End(Not run)



