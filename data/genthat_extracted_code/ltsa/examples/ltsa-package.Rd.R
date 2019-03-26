library(ltsa)


### Name: ltsa-package
### Title: Linear Time Series Analysis
### Aliases: ltsa-package ltsa
### Keywords: ts package

### ** Examples


#Example 1: DHSimulate
#First define acf for fractionally-differenced white noise and then simulate using DHSimulate
`tacvfFdwn` <-
function(d, maxlag)
{
    x <- numeric(maxlag + 1)
    x[1] <- gamma(1 - 2 * d)/gamma(1 - d)^2
    for(i in 1:maxlag) 
        x[i + 1] <- ((i - 1 + d)/(i - d)) * x[i]
    x
}
n<-1000
rZ<-tacvfFdwn(0.25, n-1) #length 1000
Z<-DHSimulate(n, rZ)
acf(Z)

#Example 2: DLAcfToAR
#
n<-10
d<-0.4
r<-tacvfFdwn(d, n)
r<-(r/r[1])[-1]
HoskingPacf<-d/(-d+(1:n))
cbind(DLAcfToAR(r),HoskingPacf)

#Example 3: DLLoglikelihood
#Using Z and rZ in Example 1.
DLLoglikelihood(rZ, Z)

#Example 4: DLResiduals
#Using Z and rZ in Example 1.
DLResiduals(rZ, Z)

#Example 5: DLSimulate
#Using Z in Example 1.
z<-DLSimulate(n, rZ)
plot.ts(z)

#Example 6: is.toeplitz
is.toeplitz(toeplitz(1:5))

#Example 7: PredictionVariance
#Compare with predict.Arima
#general script, just change z, p, q, ML
z<-sqrt(sunspot.year)
n<-length(z)
p<-9
q<-0
ML<-10
#for different data/model just reset above
out<-arima(z, order=c(p,0,q))
sda<-as.vector(predict(out, n.ahead=ML)$se)
#
phi<-theta<-numeric(0)
if (p>0) phi<-coef(out)[1:p]
if (q>0) theta<-coef(out)[(p+1):(p+q)]
zm<-coef(out)[p+q+1]
sigma2<-out$sigma2
r<-sigma2*tacvfARMA(phi, theta, maxLag=n+ML-1)
sdb<-sqrt(PredictionVariance(r, maxLead=ML))
cbind(sda,sdb)

#Example 8: tacfARMA
#There are two methods: tacvfARMA and ARMAacf.
#tacvfARMA is more general since it computes the autocovariances function
# given the ARMA parameters and the innovation variance whereas ARMAacf
# only computes the autocorrelations. Sometimes tacvfARMA is more suitable
# for what is needed and provides a better result than ARMAacf as in the
# the following example.
#
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


#Example 9: ToeplitzInverseUpdate
#In this example we compute the update inverse directly and using ToeplitzInverseUpdate and
#compare the result.
phi<-0.8
sde<-30
n<-30
r<-arima.sim(n=30,list(ar=phi),sd=sde)
r<-phi^(0:(n-1))/(1-phi^2)*sde^2
n1<-25
G<-toeplitz(r[1:n1])
GI<-solve(G) #could also use TrenchInverse
GIupdate<-ToeplitzInverseUpdate(GI,r[1:n1],r[n1+1])
GIdirect<-solve(toeplitz(r[1:(n1+1)]))
ERR<-sum(abs(GIupdate-GIdirect))
ERR


#Example 10: TrenchForecast
#Compare TrenchForecast and predict.Arima
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


#Example 11: TrenchInverse
#invert a matrix of order n and compute the maximum absolute error
# in the product of this inverse with the original matrix
n<-5	   
r<-0.8^(0:(n-1))
G<-toeplitz(r)
Gi<-TrenchInverse(G)
GGi<-crossprod(t(G),Gi)
id<-matrix(0, nrow=n, ncol=n)
diag(id)<-1
err<-max(abs(id-GGi))
err


#Example 12: TrenchLoglikelihood
#simulate a time series and compute the concentrated loglikelihood using DLLoglikelihood and
#compare this with the value given by TrenchLoglikelihood.
phi<-0.8
n<-200
r<-phi^(0:(n-1))
z<-arima.sim(model=list(ar=phi), n=n)
LD<-DLLoglikelihood(r,z)
LT<-TrenchLoglikelihood(r,z)
ans<-c(LD,LT)
names(ans)<-c("DLLoglikelihood","TrenchLoglikelihood")

#Example 13: TrenchMean
phi<- -0.9
a<-rnorm(100)
z<-numeric(length(a))
phi<- -0.9
n<-100
a<-rnorm(n)
z<-numeric(n)
mu<-100
sig<-10
z[1]<-a[1]*sig/sqrt(1-phi^2)
for (i in 2:n)
	z[i]<-phi*z[i-1]+a[i]*sig
z<-z+mu
r<-phi^(0:(n-1))
meanMLE<-TrenchMean(r,z)
meanBLUE<-mean(z)
ans<-c(meanMLE, meanBLUE)
names(ans)<-c("BLUE", "MLE")
ans





