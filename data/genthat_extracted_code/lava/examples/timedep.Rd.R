library(lava)


### Name: timedep
### Title: Time-dependent parameters
### Aliases: timedep timedep<-

### ** Examples


## Piecewise constant hazard
m <- lvm(y~1)
m <- timedep(m,y~1,timecut=c(0,5),rate=c(0.5,0.3))

## Not run: 
##D d <- sim(m,1e4); d$status <- TRUE
##D dd <- mets::lifetable(Surv(y,status)~1,data=d,breaks=c(0,5,10));
##D exp(coef(glm(events ~ offset(log(atrisk)) + -1 + interval, dd, family=poisson)))
## End(Not run)


## Piecewise constant hazard and time-varying effect of z1
m <- lvm(y~1)
distribution(m,~z1) <- ones.lvm(0.5)
R <- log(cbind(c(0.2,0.7,0.9),c(0.5,0.3,0.3)))
m <- timedep(m,y~z1,timecut=c(0,3,5),rate=R)

## Not run: 
##D d <- sim(m,1e4); d$status <- TRUE
##D dd <- mets::lifetable(Surv(y,status)~z1,data=d,breaks=c(0,3,5,Inf));
##D exp(coef(glm(events ~ offset(log(atrisk)) + -1 + interval+z1:interval, dd, family=poisson)))
## End(Not run)



## Explicit simulation of time-varying effects
m <- lvm(y~1)
distribution(m,~z1) <- ones.lvm(0.5)
distribution(m,~z2) <- binomial.lvm(p=0.5)
#variance(m,~m1+m2) <- 0
#regression(m,m1[m1:0] ~ z1) <- log(0.5)
#regression(m,m2[m2:0] ~ z1) <- log(0.3)
regression(m,m1 ~ z1,variance=0) <- log(0.5)
regression(m,m2 ~ z1,variance=0) <- log(0.3)
intercept(m,~m1+m2) <- c(-0.5,0)
m <- timedep(m,y~m1+m2,timecut=c(0,5))

## Not run: 
##D d <- sim(m,1e5); d$status <- TRUE
##D dd <- mets::lifetable(Surv(y,status)~z1,data=d,breaks=c(0,5,Inf))
##D exp(coef(glm(events ~ offset(log(atrisk)) + -1 + interval + interval:z1, dd, family=poisson)))
## End(Not run)



