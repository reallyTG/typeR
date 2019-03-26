library(NIRStat)


### Name: MAUCtest
### Title: MAUC statistics based Analysis for NIRS time series.
### Aliases: MAUCtest

### ** Examples

# Data Simulation
dat = data.frame(Y= rep(0,100),t=1:100,trans = c(rep(0,50),rep(1,50)))
dat$Y = apply(dat,1,function(x){rnorm(1,5*rnorm(1),6*exp(rnorm(1)))})
dat$Y = dat$Y + 15 - quantile(dat$Y,0.3) 
dat$Y[dat$Y<=15] = 15


# Estimate the MAUC statistics of the NIRS data and test on the difference. 
MAUCtest(dat$Y,dat$t,dat$trans,TRUE,FALSE,100)



