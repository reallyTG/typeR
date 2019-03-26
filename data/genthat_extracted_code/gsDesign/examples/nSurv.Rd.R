library(gsDesign)


### Name: nSurv
### Title: Advanced time-to-event sample size calculation
### Aliases: nSurv gsSurv print.nSurv print.gsSurv xtable.gsSurv tEventsIA
###   nEventsIA 'Advanced survival sample size'
### Keywords: design

### ** Examples

# vary accrual rate to obtain power
nSurv(lambdaC=log(2)/6, hr=.5, eta=log(2)/40,gamma=1, T=36,  minfup = 12)

# vary accrual duration to obtain power
nSurv(lambdaC=log(2)/6, hr=.5, eta=log(2)/40, gamma=6, minfup = 12)

# vary follow-up duration to obtain power
nSurv(lambdaC=log(2)/6, hr=.5, eta=log(2)/40, gamma=6, R=25)

# piecewise constant enrollment rates (vary accrual duration)
nSurv(lambdaC=log(2)/6, hr=.5, eta=log(2)/40, gamma=c(1,3,6), 
      R=c(3,6,9), minfup=12)

# stratified population (vary accrual duration)
nSurv(lambdaC=matrix(log(2)/c(6,12),ncol=2), hr=.5, eta=log(2)/40, 
      gamma=matrix(c(2,4),ncol=2), minfup=12)

# piecewise exponential failure rates (vary accrual duration)
nSurv(lambdaC=log(2)/c(6,12), hr=.5, eta=log(2)/40, S=3, gamma=6, minfup = 12)

# combine it all: 2 strata, 2 failure rate periods
nSurv(lambdaC=matrix(log(2)/c(6,12,18,24),ncol=2), hr=.5, 
      eta=matrix(log(2)/c(40,50,45,55),ncol=2), S=3, 
      gamma=matrix(c(3,6,5,7),ncol=2), R=c(5,10), minfup = 12)

# example where only 1 month of follow-up is desired
# set failure rate to 0 after 1 month using lambdaC and S
nSurv(lambdaC=c(.4,0),hr=2/3,S=1,minfup=1)

# group sequential design (vary accrual rate to obtain power)
x<-gsSurv(k=4,sfl=sfPower,sflpar=.5,lambdaC=log(2)/6, hr=.5, 
          eta=log(2)/40,gamma=1, T=36,  minfup = 12)
x
print(xtable(x,footnote="This is a footnote; note that it can be wide.", 
              caption="Caption example."))
# find expected number of events at time 12 in the above trial
nEventsIA(x=x,tIA=10)

# find time at which 1/4 of events are expected
tEventsIA(x=x,timing=.25)



