library(NIRStat)


### Name: plotNIRS
### Title: NIRS Time Series Visualization
### Aliases: plotNIRS

### ** Examples

# Data Simulation
dat = data.frame(Y= rep(0,200),t=1:200,trans = c(rep(0,100),rep(1,100)))
dat$Y = apply(dat,1,function(x){rnorm(1,5*rnorm(1),6*exp(rnorm(1)))})
dat$Y = dat$Y + 15 - quantile(dat$Y,0.3) 
dat$Y[dat$Y<=15] = 15


# Visualize the NIRS time series before and after transfusion. 
plotNIRS(dat$Y,dat$t,dat$trans)



