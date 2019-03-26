library(midasr)


### Name: select_and_forecast
### Title: Create table for different forecast horizons
### Aliases: select_and_forecast

### ** Examples

### Sets a seed for RNG ###
set.seed(1001)  
## Number of low-frequency observations
n<-250
## Linear trend and higher-frequency explanatory variables (e.g. quarterly and monthly)
trend<-c(1:n)
x<-rnorm(4*n)
z<-rnorm(12*n)
## Exponential Almon polynomial constraint-consistent coefficients
fn.x <- nealmon(p=c(1,-0.5),d=8)
fn.z <- nealmon(p=c(2,0.5,-0.1),d=17)
## Simulated low-frequency series (e.g. yearly)
y<-2+0.1*trend+mls(x,0:7,4)%*%fn.x+mls(z,0:16,12)%*%fn.z+rnorm(n)
##Do not run
## cbfc<-select_and_forecast(y~trend+mls(x,0,4)+mls(z,0,12),
## from=list(x=c(4,8,12),z=c(12,24,36)),
## to=list(x=rbind(c(14,19),c(18,23),c(22,27)),z=rbind(c(22,27),c(34,39),c(46,51))),
## insample=1:200,outsample=201:250,
## weights=list(x=c("nealmon","almonp"),z=c("nealmon","almonp")),
## wstart=list(nealmon=rep(1,3),almonp=rep(1,3)),
## IC="AIC",
## seltype="restricted",
## ftype="fixed",
## measures=c("MSE","MAPE","MASE"),
## fweights=c("EW","BICW","MSFE","DMSFE")
## )




