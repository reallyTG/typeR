library(bbmle)


### Name: mle2
### Title: Maximum Likelihood Estimation
### Aliases: mle2 mle calc_mle2_function
### Keywords: models

### ** Examples

x <- 0:10
y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
d <- data.frame(x,y)

## in general it is best practice to use the `data' argument,
##  but variables can also be drawn from the global environment
LL <- function(ymax=15, xhalf=6)
    -sum(stats::dpois(y, lambda=ymax/(1+x/xhalf), log=TRUE))
## uses default parameters of LL
(fit <- mle2(LL))
fit1F <- mle2(LL, fixed=list(xhalf=6))
coef(fit1F)
coef(fit1F,exclude.fixed=TRUE)

(fit0 <- mle2(y~dpois(lambda=ymean),start=list(ymean=mean(y)),data=d))
anova(fit0,fit)
summary(fit)
logLik(fit)
vcov(fit)
p1 <- profile(fit)
plot(p1, absVal=FALSE)
confint(fit)

## use bounded optimization
## the lower bounds are really > 0, but we use >=0 to stress-test
## profiling; note lower must be named
(fit1 <- mle2(LL, method="L-BFGS-B", lower=c(ymax=0, xhalf=0)))
p1 <- profile(fit1)

plot(p1, absVal=FALSE)
## a better parameterization:
LL2 <- function(lymax=log(15), lxhalf=log(6))
    -sum(stats::dpois(y, lambda=exp(lymax)/(1+x/exp(lxhalf)), log=TRUE))
(fit2 <- mle2(LL2))
plot(profile(fit2), absVal=FALSE)
exp(confint(fit2))
vcov(fit2)
cov2cor(vcov(fit2))

mle2(y~dpois(lambda=exp(lymax)/(1+x/exp(lhalf))),
   start=list(lymax=0,lhalf=0),
   data=d,
   parameters=list(lymax~1,lhalf~1))

## Not run: 
##D ## try bounded optimization with nlminb and constrOptim
##D (fit1B <- mle2(LL, optimizer="nlminb", lower=c(lymax=1e-7, lhalf=1e-7)))
##D p1B <- profile(fit1B)
##D confint(p1B)
##D (fit1C <- mle2(LL, optimizer="constrOptim", ui = c(lymax=1,lhalf=1), ci=2,
##D    method="Nelder-Mead"))
##D 
##D set.seed(1001)
##D lymax <- c(0,2)
##D lhalf <- 0
##D x <- sort(runif(200))
##D g <- factor(sample(c("a","b"),200,replace=TRUE))
##D y <- rnbinom(200,mu=exp(lymax[g])/(1+x/exp(lhalf)),size=2)
##D d2 <- data.frame(x,g,y)
##D 
##D fit3 <- mle2(y~dnbinom(mu=exp(lymax)/(1+x/exp(lhalf)),size=exp(logk)),
##D     parameters=list(lymax~g),data=d2,
##D     start=list(lymax=0,lhalf=0,logk=0))
## End(Not run)



