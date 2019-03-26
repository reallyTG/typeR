library(ltsa)


### Name: TrenchForecast
### Title: Minimum Mean Square Forecast
### Aliases: TrenchForecast
### Keywords: ts

### ** Examples

#Example 1. Compare TrenchForecast and predict.Arima
#general script, just change z, p, q, ML
z<-sqrt(sunspot.year)
n<-length(z)
p<-9
q<-0
ML<-10
#for different data/model just reset above
out<-arima(z, order=c(p,0,q))
Fp<-predict(out, n.ahead=ML)

phi<-theta<-numeric(0)
if (p>0) phi<-coef(out)[1:p]
if (q>0) theta<-coef(out)[(p+1):(p+q)]
zm<-coef(out)[p+q+1]
sigma2<-out$sigma2
#r<-var(z)*ARMAacf(ar=phi, ma=theta, lag.max=n+ML-1)
#When r is computed as above, it is not identical to below
r<-sigma2*tacvfARMA(phi, theta, maxLag=n+ML-1)
F<-TrenchForecast(z, r, zm, n, maxLead=ML)
#the forecasts are identical using tacvfARMA
#    
#Example 2. Compare AR(1) Forecasts.  Show how 
#Forecasts from AR(1) are easily calculated directly. 
#We compare AR(1) forecasts and their sd's.
#Define a function for the AR(1) case
AR1Forecast <- function(z,phi,n,maxLead){
        nz<-length(z)
        m<-nz-n
        zf<-vf<-matrix(numeric(maxLead*m),ncol=maxLead)
        zorigin<-z[n:nz]
        zf<-outer(zorigin,phi^(1:maxLead))
        vf<-matrix(rep(1-phi^(2*(1:maxLead)),m+1),byrow=TRUE,ncol=maxLead)/(1-phi^2)
        list(zf=zf,sdf=sqrt(vf))
        }
#generate AR(1) series and compare the forecasts
phi<-0.9
n<-200
m<-5
N<-n+m
z<-arima.sim(list(ar=phi), n=N)
maxLead<-3
nr<-N+maxLead-1
r<-(1/(1-phi^2))*phi^(0:nr) 
ansT1<-TrenchForecast(z,r,0,n,maxLead)
ansT2<-TrenchForecast(z,r,0,n,maxLead,UpdateAlgorithmQ=FALSE)
ansAR1<-AR1Forecast(z,phi,n,maxLead)



