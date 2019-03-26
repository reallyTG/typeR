library(midasr)


### Name: average_forecast
### Title: Average forecasts of MIDAS models
### Aliases: average_forecast

### ** Examples

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
mod1 <- midas_r(y ~ trend + mls(x, 4:14, 4, nealmon) + mls(z, 12:22, 12, nealmon),
                start=list(x=c(10,1,-0.1),z=c(2,-0.1)))
mod2 <- midas_r(y ~ trend + mls(x, 4:20, 4, nealmon) + mls(z, 12:25, 12, nealmon),
                start=list(x=c(10,1,-0.1),z=c(2,-0.1)))

##Calculate average forecasts
avgf <- average_forecast(list(mod1,mod2),
                        data=list(y=y,x=x,z=z,trend=trend),
                        insample=1:200,outsample=201:250,
                        type="fixed",                            
                        measures=c("MSE","MAPE","MASE"),
                        fweights=c("EW","BICW","MSFE","DMSFE"))



