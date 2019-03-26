library(ltsa)


### Name: PredictionVariance
### Title: Prediction variance
### Aliases: PredictionVariance
### Keywords: ts

### ** Examples

#Example 1. Compare using DL method or Trench method
va<-PredictionVariance(0.9^(0:10), maxLead=10)
vb<-PredictionVariance(0.9^(0:10), maxLead=10, DLQ=FALSE)
cbind(va,vb)
# 
#Example 2. Compare with predict.Arima
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
#
# 
#Example 3. DL and Trench method can give different results
#  when the acvf is slowly decaying. Trench is always
#  exact based on a finite-sample.
L<-5
r<-1/sqrt(1:(L+1))
va<-PredictionVariance(r, maxLead=L)
vb<-PredictionVariance(r, maxLead=L, DLQ=FALSE)
cbind(va,vb) #results are slightly different
r<-1/sqrt(1:(1000)) #larger number of autocovariances
va<-PredictionVariance(r, maxLead=L)
vb<-PredictionVariance(r, maxLead=L, DLQ=FALSE)
cbind(va,vb) #results now agree



