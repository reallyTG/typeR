library(drgee)


### Name: drgee
### Title: Doubly Robust Generalized Estimating Equations
### Aliases: drgee coef.drgee vcov.drgee print.drgee summary.drgee
###   print.summary.drgee
### Keywords: models regression cluster

### ** Examples


## DR-estimation when
## the main model is
## E(Y|A,L1,L2)-E(Y|A=0,L1,L2)=beta0*A+beta1*A*L1
## and the outcome nuisance model is
## E(Y|A=0,L1,L2)=gamma0+gamma1*L1+gamma2*L2
## and the exposure nuisance model is
## E(A|Y=0,L1,L2)=expit(alpha0+alpha1*L1+alpha2*l2)

library(drgee)

expit<-function(x) exp(x)/(1+exp(x))

n<-5000

## nuisance
l1<-rnorm(n, mean = 0, sd = 1)
l2<-rnorm(n, mean = 0, sd = 1)

beta0<-1.5
beta1<-1
gamma0<--1
gamma1<--2
gamma2<-2
alpha0<-1
alpha1<-5
alpha2<-3

## Exposure generated from the exposure nuisance model
a<-rbinom(n,1,expit(alpha0 + alpha1*l1 + alpha2*l2))
## Outcome generated from the main model and the
## outcome nuisance model
y<-rnorm(n,
mean = beta0 * a + beta1 * a * l1 + gamma0 + gamma1 * l1 + gamma2 * l2,
sd = 1)

simdata<-data.frame(y,a,l1,l2)

## outcome nuisance model misspecified and
## exposure nuisance model correctly specified

## DR-estimation
dr.est <- drgee(oformula = formula(y~l1),
eformula = formula(a~l1+l2),
iaformula = formula(~l1),
olink = "identity", elink = "logit",
data = simdata, estimation.method = "dr")
summary(dr.est)

## O-estimation
o.est <- drgee(exposure = "a", oformula = formula(y~l1),
iaformula = formula(~l1), olink = "identity",
data = simdata, estimation.method = "o")
summary(o.est)

## E-estimation
e.est <- drgee(outcome = "y", eformula = formula(a~l1+l2),
iaformula = formula(~l1), elink="logit",
data = simdata, estimation.method = "e")
summary(e.est)



