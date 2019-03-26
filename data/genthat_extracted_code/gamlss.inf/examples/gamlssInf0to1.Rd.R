library(gamlss.inf)


### Name: gamlssInf0to1
### Title: GAMLSS model for a proportion response variable with point(s)
###   mass at 0 and or 1.
### Aliases: gamlssInf0to1
### Keywords: regression

### ** Examples


# 1. An artificial example using simulated data

# Firstly, we use function gen.Family() to create the logit skew 
# student t (logitSST) distribution defined in the (0,1) interval, 
# and function gen.Inf0to1() to create the 0-inflated logitSST 
# distribution defined in [0,1).

gen.Family("SST", "logit")
gen.Inf0to1("logitSST","Zero") 

#now we can generate the data and run the model 
set.seed(10)
Y <- rlogitSSTInf0(500,mu=0.5,sigma=0.7,nu=0.5,tau=5,xi0=0.5,log=FALSE)
dat <- data.frame(Y)
dat$x <- rnorm(500)
m1 <- gamlssInf0to1(y=Y,mu.formula=~x, sigma.formula=~x,
                    nu.formula=~x, tau.formula=~x,
                    xi0.formula=~x,data=dat, family=logitSST)
summary(m1)

# 2. Example of equivalent gamlss models for an inflated-at-1 Beta distribution 

Y <- rBEINF1(500,mu=0.5,sigma=0.7,nu=0.5)
m2 <- gamlss(Y~1,sigma.formula=~1,nu.formula=~1,family=BEINF1)
m3.1 <- gamlss(Y[Y<1]~1,sigma.formula=~1,family=BE)
m3.2 <- gamlss(I(Y==1)~1,family=BI)
m4 <- gamlssInf0to1(Y,mu.formula=~1,sigma.formula=~1,xi1=~1,family=BE)
stopifnot(all.equal(deviance(m2),(deviance(m3.1)+deviance(m3.2))), 
          all.equal(deviance(m2),deviance(m4)))



