library(gamm4)


### Name: gamm4
### Title: Generalized Additive Mixed Models using lme4 and mgcv
### Aliases: gamm4
### Keywords: models smooth regression

### ** Examples

## NOTE: most examples are flagged as 'do not run' simply to
## save time in package checking on CRAN.

###################################
## A simple additive mixed model...
###################################
library(gamm4)

set.seed(0) 
dat <- gamSim(1,n=400,scale=2) ## simulate 4 term additive truth
## Now add 20 level random effect `fac'...
dat$fac <- fac <- as.factor(sample(1:20,400,replace=TRUE))
dat$y <- dat$y + model.matrix(~fac-1)%*%rnorm(20)*.5

br <- gamm4(y~s(x0)+x1+s(x2),data=dat,random=~(1|fac))
plot(br$gam,pages=1)

summary(br$gam) ## summary of gam
summary(br$mer) ## underlying mixed model
anova(br$gam) 

## compare gam fit of the same
bg <- gam(y~s(x0)+x1+s(x2)+s(fac,bs="re"),
          data=dat,method="REML")
plot(bg,pages=1)
gam.vcomp(bg)

##########################
## Poisson example GAMM...
##########################
## simulate data...
x <- runif(100)
fac <- sample(1:20,100,replace=TRUE)
eta <- x^2*3 + fac/20; fac <- as.factor(fac)
y <- rpois(100,exp(eta))

## fit model and examine it...
bp <- gamm4(y~s(x),family=poisson,random=~(1|fac))
plot(bp$gam)
bp$mer

## Not run: 
##D #################################################################
##D ## Add a factor to the linear predictor, to be modelled as random
##D ## and make response Poisson. Again compare `gamm' and `gamm4'
##D #################################################################
##D set.seed(6)
##D dat <- gamSim(1,n=400,scale=2) ## simulate 4 term additive truth
##D ## add random effect...
##D g <- as.factor(sample(1:20,400,replace=TRUE))
##D dat$f <- dat$f + model.matrix(~ g-1)%*%rnorm(20)*2
##D dat$y <- rpois(400,exp(dat$f/7+1))
##D 
##D b2<-gamm(y~s(x0)+s(x1)+s(x2)+s(x3),family=poisson,
##D          data=dat,random=list(g=~1))
##D plot(b2$gam,pages=1)
##D 
##D b2r<-gamm4(y~s(x0)+s(x1)+s(x2)+s(x3),family=poisson,
##D          data=dat,random = ~ (1|g))
##D 
##D plot(b2r$gam,pages=1)
##D 
##D rm(dat)
##D vis.gam(b2r$gam,theta=35)
##D 
##D 
##D ##################################
##D # Multivariate varying coefficient
##D # With crossed and nested random 
##D # effects.
##D ##################################
##D 
##D ## Start by simulating data...
##D 
##D f0 <- function(x, z, sx = 0.3, sz = 0.4) {
##D             (pi^sx * sz) * (1.2 * exp(-(x - 0.2)^2/sx^2 - (z -
##D                 0.3)^2/sz^2) + 0.8 * exp(-(x - 0.7)^2/sx^2 -
##D                 (z - 0.8)^2/sz^2))
##D         }
##D f1 <- function(x2) 2 * sin(pi * x2)
##D f2 <- function(x2) exp(2 * x2) - 3.75887
##D f3 <- function (x2) 0.2 * x2^11 * (10 * (1 - x2))^6 + 10 * (10 * x2)^3 *
##D             (1 - x2)^10
##D 
##D n <- 1000
##D 
##D ## first set up a continuous-within-group effect...
##D 
##D g <- factor(sample(1:50,n,replace=TRUE)) ## grouping factor
##D x <- runif(n)                       ## continuous covariate
##D X <- model.matrix(~g-1)
##D mu <- X%*%rnorm(50)*.5 + (x*X)%*%rnorm(50)
##D 
##D ## now add nested factors...
##D a <- factor(rep(1:20,rep(50,20)))
##D b <- factor(rep(rep(1:25,rep(2,25)),rep(20,50)))
##D Xa <- model.matrix(~a-1)
##D Xb <- model.matrix(~a/b-a-1)
##D mu <- mu + Xa%*%rnorm(20) + Xb%*%rnorm(500)*.5
##D 
##D ## finally simulate the smooth terms
##D v <- runif(n);w <- runif(n);z <- runif(n)
##D r <- runif(n)
##D mu <- mu + f0(v,w)*z*10 + f3(r) 
##D 
##D y <- mu + rnorm(n)*2 ## response data
##D 
##D ## First compare gamm and gamm4 on a reduced model
##D 
##D br <- gamm4(y ~ s(v,w,by=z) + s(r,k=20,bs="cr"),random = ~ (1|a/b))
##D 
##D ba <- gamm(y ~ s(v,w,by=z) + s(r,k=20,bs="cr"),random = list(a=~1,b=~1),method="REML")
##D 
##D 
##D par(mfrow=c(2,2))
##D plot(br$gam)
##D 
##D plot(ba$gam)
##D 
##D ## now fit the full model
##D 
##D br <- gamm4(y ~ s(v,w,by=z) + s(r,k=20,bs="cr"),random = ~ (x+0|g) + (1|g) + (1|a/b))
##D 
##D br$mer
##D br$gam
##D plot(br$gam)
##D 
##D ## try a Poisson example, based on the same linear predictor...
##D 
##D lp <- mu/5
##D y <- rpois(exp(lp),exp(lp)) ## simulated response
##D 
##D ## again compare gamm and gamm4 on reduced model
##D 
##D br <- gamm4(y ~ s(v,w,by=z) + s(r,k=20,bs="cr"),family=poisson,random = ~ (1|a/b))
##D 
##D ba <- gamm(y ~ s(v,w,by=z) + s(r,k=20,bs="cr"),family=poisson,random = list(a=~1,b=~1))
##D 
##D par(mfrow=c(2,2))
##D plot(br$gam)
##D plot(ba$gam)
##D 
##D ## and now fit full version (very slow)...
##D 
##D br <- gamm4(y ~ s(v,w,by=z) + s(r,k=20,bs="cr"),family=poisson,random = ~ (x|g) + (1|a/b))
##D br$mer
##D br$gam
##D plot(br$gam)
##D 
##D 
##D ####################################
##D # Different smooths of x2 depending 
##D # on factor `fac'...
##D ####################################
##D dat <- gamSim(4)
##D 
##D br <- gamm4(y ~ fac+s(x2,by=fac)+s(x0),data=dat)
##D plot(br$gam,pages=1)
##D summary(br$gam)
##D 
##D 
##D ####################################
##D # Timing comparison with `gam'...  #                                      
##D ####################################
##D 
##D dat <- gamSim(1,n=600,dist="binary",scale=.33)
##D 
##D system.time(lr.fit0 <- gam(y~s(x0)+s(x1)+s(x2),
##D             family=binomial,data=dat,method="ML"))
##D 
##D system.time(lr.fit <- gamm4(y~s(x0)+s(x1)+s(x2),
##D             family=binomial,data=dat))
##D 
##D lr.fit0;lr.fit$gam
##D cor(fitted(lr.fit0),fitted(lr.fit$gam))
##D 
##D ## plot model components with truth overlaid in red
##D op <- par(mfrow=c(2,2))
##D fn <- c("f0","f1","f2","f3");xn <- c("x0","x1","x2","x3")
##D for (k in 1:3) {
##D   plot(lr.fit$gam,select=k)
##D   ff <- dat[[fn[k]]];xx <- dat[[xn[k]]]
##D   ind <- sort.int(xx,index.return=TRUE)$ix
##D   lines(xx[ind],(ff-mean(ff))[ind]*.33,col=2)
##D }
##D par(op)
## End(Not run)

######################################
## A "signal" regression example, in
## which a univariate response depends
## on functional predictors.
######################################

## simulate data first....

rf <- function(x=seq(0,1,length=100)) {
## generates random functions...
  m <- ceiling(runif(1)*5) ## number of components
  f <- x*0;
  mu <- runif(m,min(x),max(x));sig <- (runif(m)+.5)*(max(x)-min(x))/10
  for (i in 1:m) f <- f+ dnorm(x,mu[i],sig[i])
  f
}

x <- seq(0,1,length=100) ## evaluation points

## example functional predictors...
par(mfrow=c(3,3));for (i in 1:9) plot(x,rf(x),type="l",xlab="x")

## simulate 200 functions and store in rows of L...
L <- matrix(NA,200,100) 
for (i in 1:200) L[i,] <- rf()  ## simulate the functional predictors

f2 <- function(x) { ## the coefficient function
  (0.2*x^11*(10*(1-x))^6+10*(10*x)^3*(1-x)^10)/10 
}

f <- f2(x) ## the true coefficient function

y <- L%*%f + rnorm(200)*20 ## simulated response data

## Now fit the model E(y) = L%*%f(x) where f is a smooth function.
## The summation convention is used to evaluate smooth at each value
## in matrix X to get matrix F, say. Then rowSum(L*F) gives E(y).

## create matrix of eval points for each function. Note that
## `smoothCon' is smart and will recognize the duplication...
X <- matrix(x,200,100,byrow=TRUE) 

## compare `gam' and `gamm4' this time

b <- gam(y~s(X,by=L,k=20),method="REML")
br <- gamm4(y~s(X,by=L,k=20))
par(mfrow=c(2,1))
plot(b,shade=TRUE);lines(x,f,col=2)
plot(br$gam,shade=TRUE);lines(x,f,col=2)




