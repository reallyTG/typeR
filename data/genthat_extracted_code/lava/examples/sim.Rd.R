library(lava)


### Name: sim
### Title: Simulate model
### Aliases: sim sim.lvmfit sim.lvm simulate.lvmfit simulate.lvm
###   transform<- transform<-.lvm transform.lvm functional functional<-
###   functional.lvm functional<-.lvm distribution distribution<-
###   distribution.lvm distribution<-.lvm heavytail heavytail<- weibull.lvm
###   binomial.lvm poisson.lvm uniform.lvm beta.lvm normal.lvm mvn.lvm
###   lognormal.lvm gaussian.lvm GM2.lvm GM3.lvm probit.lvm logit.lvm
###   pareto.lvm student.lvm chisq.lvm coxGompertz.lvm coxWeibull.lvm
###   coxExponential.lvm aalenExponential.lvm Gamma.lvm gamma.lvm
###   loggamma.lvm categorical categorical<- threshold.lvm ones.lvm
###   sequence.lvm
### Keywords: datagen models regression

### ** Examples

##################################################
## Logistic regression
##################################################
m <- lvm(y~x+z)
regression(m) <- x~z
distribution(m,~y+z) <- binomial.lvm("logit")
d <- sim(m,1e3)
head(d)
e <- estimate(m,d,estimator="glm")
e
## Simulate a few observation from estimated model
sim(e,n=5)
##################################################
## Poisson
##################################################
distribution(m,~y) <- poisson.lvm()
d <- sim(m,1e4,p=c(y=-1,"y~x"=2,z=1))
head(d)
estimate(m,d,estimator="glm")
mean(d$z); lava:::expit(1)
summary(lm(y~x,sim(lvm(y[1:2]~4*x),1e3)))
##################################################
### Gamma distribution
##################################################
m <- lvm(y~x)
distribution(m,~y+x) <- list(Gamma.lvm(shape=2),binomial.lvm())
intercept(m,~y) <- 0.5
d <- sim(m,1e4)
summary(g <- glm(y~x,family=Gamma(),data=d))
## Not run: MASS::gamma.shape(g)
args(lava::Gamma.lvm)
distribution(m,~y) <- Gamma.lvm(shape=2,log=TRUE)
sim(m,10,p=c(y=0.5))[,"y"]
##################################################
### Beta
##################################################
m <- lvm()
distribution(m,~y) <- beta.lvm(alpha=2,beta=1)
var(sim(m,100,"y,y"=2))
distribution(m,~y) <- beta.lvm(alpha=2,beta=1,scale=FALSE)
var(sim(m,100))
##################################################
### Transform
##################################################
m <- lvm()
transform(m,xz~x+z) <- function(x) x[1]*(x[2]>0)
regression(m) <- y~x+z+xz
d <- sim(m,1e3)
summary(lm(y~x+z + x*I(z>0),d))
##################################################
### Non-random variables
##################################################
m <- lvm()
distribution(m,~x+z+v+w) <- list(sequence.lvm(0,5),## Seq. 0 to 5 by 1/n
                               ones.lvm(),       ## Vector of ones
                               ones.lvm(0.5),    ##  0.8n 0, 0.2n 1
                               ones.lvm(interval=list(c(0.3,0.5),c(0.8,1))))
sim(m,10)
##################################################
### Cox model
### piecewise constant hazard
################################################
m <- lvm(t~x)
rates <- c(1,0.5); cuts <- c(0,5)
## Constant rate: 1 in [0,5), 0.5 in [5,Inf)
distribution(m,~t) <- coxExponential.lvm(rate=rates,timecut=cuts)
## Not run: 
##D     d <- sim(m,2e4,p=c("t~x"=0.1)); d$status <- TRUE
##D     plot(timereg::aalen(survival::Surv(t,status)~x,data=d,
##D                         resample.iid=0,robust=0),spec=1)
##D     L <- approxfun(c(cuts,max(d$t)),f=1,
##D                    cumsum(c(0,rates*diff(c(cuts,max(d$t))))),
##D                    method="linear")
##D     curve(L,0,100,add=TRUE,col="blue")
## End(Not run)
##################################################
### Cox model
### piecewise constant hazard, gamma frailty
##################################################
m <- lvm(y~x+z)
rates <- c(0.3,0.5); cuts <- c(0,5)
distribution(m,~y+z) <- list(coxExponential.lvm(rate=rates,timecut=cuts),
                             loggamma.lvm(rate=1,shape=1))
## Not run: 
##D     d <- sim(m,2e4,p=c("y~x"=0,"y~z"=0)); d$status <- TRUE
##D     plot(timereg::aalen(survival::Surv(y,status)~x,data=d,
##D                         resample.iid=0,robust=0),spec=1)
##D     L <- approxfun(c(cuts,max(d$y)),f=1,
##D                    cumsum(c(0,rates*diff(c(cuts,max(d$y))))),
##D                    method="linear")
##D     curve(L,0,100,add=TRUE,col="blue")
## End(Not run)
## Equivalent via transform (here with Aalens additive hazard model)
m <- lvm(y~x)
distribution(m,~y) <- aalenExponential.lvm(rate=rates,timecut=cuts)
distribution(m,~z) <- Gamma.lvm(rate=1,shape=1)
transform(m,t~y+z) <- prod
sim(m,10)
## Shared frailty
m <- lvm(c(t1,t2)~x+z)
rates <- c(1,0.5); cuts <- c(0,5)
distribution(m,~y) <- aalenExponential.lvm(rate=rates,timecut=cuts)
distribution(m,~z) <- loggamma.lvm(rate=1,shape=1)
## Not run: 
##D mets::fast.reshape(sim(m,100),varying="t")
## End(Not run)
##################################################
### General multivariate distributions
##################################################
## Not run: 
##D m <- lvm()
##D distribution(m,~y1+y2,oratio=4) <- VGAM::rbiplackcop
##D ksmooth2(sim(m,1e4),rgl=FALSE,theta=-20,phi=25)
##D m <- lvm()
##D distribution(m,~z1+z2,"or1") <- VGAM::rbiplackcop
##D distribution(m,~y1+y2,"or2") <- VGAM::rbiplackcop
##D sim(m,10,p=c(or1=0.1,or2=4))
## End(Not run)
m <- lvm()
distribution(m,~y1+y2+y3,TRUE) <- function(n,...) rmvn0(n,sigma=diag(3)+1)
var(sim(m,100))
## Syntax also useful for univariate generators, e.g.
m <- lvm(y~x+z)
distribution(m,~y,TRUE) <- function(n) rnorm(n,mean=1000)
sim(m,5)
distribution(m,~y,"m1",0) <- rnorm
sim(m,5)
sim(m,5,p=c(m1=100))
##################################################
### Regression design in other parameters
##################################################
## Variance heterogeneity
m <- lvm(y~x)
distribution(m,~y) <- function(n,mean,x) rnorm(n,mean,exp(x)^.5)
if (interactive()) plot(y~x,sim(m,1e3))
## Alternaively, calculate the standard error directly
addvar(m) <- ~sd ## If 'sd' should be part of the resulting data.frame
constrain(m,sd~x) <- function(x) exp(x)^.5
distribution(m,~y) <- function(n,mean,sd) rnorm(n,mean,sd)
if (interactive()) plot(y~x,sim(m,1e3))
## Regression on variance parameter
m <- lvm()
regression(m) <- y~x
regression(m) <- v~x
##distribution(m,~v) <- 0 # No stochastic term
## Alternative:
## regression(m) <- v[NA:0]~x
distribution(m,~y) <- function(n,mean,v) rnorm(n,mean,exp(v)^.5)
if (interactive()) plot(y~x,sim(m,1e3))
## Regression on shape parameter in Weibull model
m <- lvm()
regression(m) <- y ~ z+v
regression(m) <- s ~ exp(0.6*x-0.5*z)
distribution(m,~x+z) <- binomial.lvm()
distribution(m,~cens) <- coxWeibull.lvm(scale=1)
distribution(m,~y) <- coxWeibull.lvm(scale=0.1,shape=~s)
eventTime(m) <- time ~ min(y=1,cens=0)
if (interactive()) {
    d <- sim(m,1e3)
    require(survival)
    (cc <- coxph(Surv(time,status)~v+strata(x,z),data=d))
    plot(survfit(cc) ,col=1:4,mark.time=FALSE)
}
##################################################
### Categorical predictor
##################################################
m <- lvm()
## categorical(m,K=3) <- "v"
categorical(m,labels=c("A","B","C")) <- "v"
regression(m,additive=FALSE) <- y~v
## Not run: 
##D plot(y~v,sim(m,1000,p=c("y~v:2"=3)))
## End(Not run)
m <- lvm()
categorical(m,labels=c("A","B","C"),p=c(0.5,0.3)) <- "v"
regression(m,additive=FALSE,beta=c(0,2,-1)) <- y~v
## equivalent to:
## regression(m,y~v,additive=FALSE) <- c(0,2,-1)
regression(m,additive=FALSE,beta=c(0,4,-1)) <- z~v
table(sim(m,1e4)$v)
glm(y~v, data=sim(m,1e4))
glm(y~v, data=sim(m,1e4,p=c("y~v:1"=3)))

transform(m,v2~v) <- function(x) x=='A'
sim(m,10)

##################################################
### Pre-calculate object
##################################################
m <- lvm(y~x)
m2 <- sim(m,'y~x'=2)
sim(m,10,'y~x'=2)
sim(m2,10) ## Faster




