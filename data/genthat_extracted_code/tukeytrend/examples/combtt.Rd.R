library(tukeytrend)


### Name: combtt
### Title: Combine several pobjects of class 'tukeytrend'
### Aliases: combtt
### Keywords: misc

### ** Examples


# Simulated data for normal and binomial response

dat <- data.frame(y = rnorm(20,0,1), 
 succ=rbinom(n=20, size=10, prob=0.3), 
 dose=rep(c(0,1,2,5,10), each=4))

# linear models with 3 different 
# scalings of the dose variable

fitn <- lm(y~dose, data=dat)
ttn <- tukeytrendfit(fitn, dose="dose",
 scaling=c("ari", "ord", "arilog"))

# generalized linear models with 3 
# different scalings of the dose variable
fitb <- glm(cbind(succ, 10-succ)~dose, data=dat, family=binomial)
ttb <- tukeytrendfit(fitb, dose="dose", 
 scaling=c("ari", "ord", "arilog"))

# concatenate the normal and binomial models
ttnb <- combtt(ttn, ttb)

# joint inference for the 6 regression slopes
summary(asglht(ttnb))




