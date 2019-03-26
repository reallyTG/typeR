library(mgcv)


### Name: jagam
### Title: Just Another Gibbs Additive Modeller: JAGS support for mgcv.
### Aliases: jagam sim2jam
### Keywords: models smooth regression

### ** Examples

## the following illustrates a typical workflow. To run the 
## 'Not run' code you need rjags (and JAGS) to be installed.
require(mgcv)
  
set.seed(2) ## simulate some data... 
n <- 400
dat <- gamSim(1,n=n,dist="normal",scale=2)
## regular gam fit for comparison...
b0 <- gam(y~s(x0)+s(x1) + s(x2)+s(x3),data=dat,method="REML")

## Set directory and file name for file containing jags code.
## In real use you would *never* use tempdir() for this. It is
## only done here to keep CRAN happy, and avoid any chance of
## an accidental overwrite. Instead you would use
## setwd() to set an appropriate working directory in which
## to write the file, and just set the file name to what you
## want to call it (e.g. "test.jags" here). 

jags.file <- paste(tempdir(),"/test.jags",sep="") 

## Set up JAGS code and data. In this one might want to diagonalize
## to use conjugate samplers. Usually call 'setwd' first, to set
## directory in which model file ("test.jags") will be written.

jd <- jagam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat,file=jags.file,
            sp.prior="gamma",diagonalize=TRUE)

## In normal use the model in "test.jags" would now be edited to add 
## the non-standard stochastic elements that require use of JAGS....

## Not run: 
##D require(rjags)
##D load.module("glm") ## improved samplers for GLMs often worth loading
##D jm <-jags.model(jags.file,data=jd$jags.data,inits=jd$jags.ini,n.chains=1)
##D list.samplers(jm)
##D sam <- jags.samples(jm,c("b","rho","scale"),n.iter=10000,thin=10)
##D jam <- sim2jam(sam,jd$pregam)
##D plot(jam,pages=1)
##D jam
##D pd <- data.frame(x0=c(.5,.6),x1=c(.4,.2),x2=c(.8,.4),x3=c(.1,.1))
##D fv <- predict(jam,newdata=pd)
##D ## and some minimal checking...
##D require(coda)
##D effectiveSize(as.mcmc.list(sam$b))
## End(Not run)

## a gamma example...
set.seed(1); n <- 400
dat <- gamSim(1,n=n,dist="normal",scale=2)
scale <- .5; Ey <- exp(dat$f/2)
dat$y <- rgamma(n,shape=1/scale,scale=Ey*scale)
jd <- jagam(y~s(x0)+te(x1,x2)+s(x3),data=dat,family=Gamma(link=log),
            file=jags.file,sp.prior="log.uniform")

## In normal use the model in "test.jags" would now be edited to add 
## the non-standard stochastic elements that require use of JAGS....

## Not run: 
##D require(rjags)
##D ## following sets random seed, but note that under JAGS 3.4 many
##D ## models are still not fully repeatable (JAGS 4 should fix this)
##D jd$jags.ini$.RNG.name <- "base::Mersenne-Twister" ## setting RNG
##D jd$jags.ini$.RNG.seed <- 6 ## how to set RNG seed
##D jm <-jags.model(jags.file,data=jd$jags.data,inits=jd$jags.ini,n.chains=1)
##D list.samplers(jm)
##D sam <- jags.samples(jm,c("b","rho","scale","mu"),n.iter=10000,thin=10)
##D jam <- sim2jam(sam,jd$pregam)
##D plot(jam,pages=1)
##D jam
##D pd <- data.frame(x0=c(.5,.6),x1=c(.4,.2),x2=c(.8,.4),x3=c(.1,.1))
##D fv <- predict(jam,newdata=pd)
## End(Not run)




