library(ltsa)


### Name: tacvfARMA
### Title: theoretical autocovariance function (acvf) of ARMA
### Aliases: tacvfARMA
### Keywords: ts

### ** Examples

#Example 1.  Estimate the acvf of a fitted ARMA model
#There are two methods but they give slighly different results,
#general script, just change z, p, q, ML
z<-sqrt(sunspot.year)
n<-length(z)
p<-9
q<-0
ML<-5
#for different data/model just reset above
out<-arima(z, order=c(p,0,q))
phi<-theta<-numeric(0)
if (p>0) phi<-coef(out)[1:p]
if (q>0) theta<-coef(out)[(p+1):(p+q)]
zm<-coef(out)[p+q+1]
sigma2<-out$sigma2
rA<-tacvfARMA(phi, theta, maxLag=n+ML-1, sigma2=sigma2)
rB<-var(z)*ARMAacf(ar=phi, ma=theta, lag.max=n+ML-1)
#rA and rB are slighly different
cbind(rA[1:5],rB[1:5])
#
#Example 2. Compute Rsq for fitted ARMA model
#Rsq = 1 - (series variance / innovation variance)
#Again there are two methods but only the first method is guaranteed to
#produce an Rsq which is non-negative!
#Run last example and then evaluate the script below:
RsqA <- 1 - rA/sigma2
RsqB <- 1 - rB/sigma2
#
#Example 3. Test if model is stationary-causal or not.
StationaryQ <- function(phi) tryCatch(is.vector(tacvfARMA(phi=phi)),error=function(e) FALSE )
StationaryQ(1.1) #AR(1) with phi=1.1 is not stationary-causal.
#try with parameters from Example 1 above
StationaryQ(phi)



