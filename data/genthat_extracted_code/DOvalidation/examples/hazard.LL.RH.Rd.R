library(DOvalidation)


### Name: hazard.LL.RH
### Title: Local Linear Hazard Estimator (Ramlau-Hansen Weighting)
### Aliases: hazard.LL.RH
### Keywords: nonparametric survival

### ** Examples

## This example was described by Gamiz et al. (2016) to analyse the exposure robustness of
## local linear hazards with natural weigthing and Ramlau-Hansen weighting
data(Iceland)
Ei<-Iceland$E
Oi<-Iceland$D
xi<-40:110
n<-length(xi)
x<-seq(xi[1],xi[n],length=100)

## Hazard estimates with the original data
b0<-11.9899
alphaIC17<-hazard.LL.RH(xi,Oi,Ei,x,b=b0,K="sextic")$hLL
alLL17<-hazard.LL(xi,Oi,Ei,x,b=b0,K="sextic",Ktype="symmetric")$hLL
hi<-Oi/Ei;hi[Ei==0]<-0
print(round(hi[60:71],3))
## Hazard estimates with the modified data (one change in the exposure)
Ei2<-Ei; Ei2[67]<-2/365
alphaIC005<-hazard.LL.RH(xi,Oi,Ei2,x,b=b0,K="sextic")$hLL
alLL005<-hazard.LL(xi,Oi,Ei2,x,b=b0,K="sextic",Ktype="symmetric")$hLL

## Figure: Exposure robustness
old.par<-par(mfrow=c(2,2))
plot(x[73:100],alphaIC17[73:100],lwd=2,type='l',main='Exposure: 0.17',
xlab='',ylab='Ramlau-Hansen weighting')
plot(x[73:100],alphaIC005[73:100],lwd=2,type='l',main='Exposure: 0.005',
xlab='',ylab='Ramlau-Hansen weighting')
plot(x[73:100],alLL17[73:100],lwd=2,type='l',main='Exposure: 0.17',
xlab='',ylab='Natural  weighting')
plot(x[73:100],alLL005[73:100],lwd=2,type='l',main='Exposure: 0.005',
xlab='',ylab='Natural weighting')

par(old.par)



