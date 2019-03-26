library(ltsa)


### Name: DLAcfToAR
### Title: Autocorrelations to AR parameters
### Aliases: DLAcfToAR
### Keywords: ts

### ** Examples

#Example 1:  Yule-Walker estimates
z<-log(lynx)
p<-11
r<-(acf(z, lag.max=p, plot=FALSE)$acf)[-1]
ans<-DLAcfToAR(r)
#compare with built-in ar
phiAR<-ar(z,aic=FALSE, order.max=p, method="yw")$ar
#yet another way is to use acf2AR
phi2<-(acf2AR(c(1,r)))[p,]
cbind(ans,phiAR,phi2)
#   
#Example 2:  AR(1) illustration
#For AR(1) case compare useC = T and F
r<-0.9^(1:3)
DLAcfToAR(r, useC=TRUE)
DLAcfToAR(r, useC=FALSE)
DLAcfToAR(r, useC=TRUE, PDSequenceTestQ=TRUE)
DLAcfToAR(r, useC=FALSE, PDSequenceTestQ=TRUE)
#
#Example 3: test for valid tacf
r<-c(0.8, rep(0,99))
DLAcfToAR(r, PDSequenceTestQ=TRUE)
#   
#Example 4: Fractional-difference example
#Hosking (1981), pacf, zeta[k]=d/(k-d)
#we compare this numerically with our procedure
`tacvfFdwn` <-
function(d, maxlag)
{
    x <- numeric(maxlag + 1)
    x[1] <- gamma(1 - 2 * d)/gamma(1 - d)^2
    for(i in 1:maxlag) 
        x[i + 1] <- ((i - 1 + d)/(i - d)) * x[i]
    x
}
n<-10
d<-0.4
r<-tacvfFdwn(d, n)
r<-(r/r[1])[-1]
HoskingPacf<-d/(-d+(1:n))
cbind(DLAcfToAR(r),HoskingPacf)
#
# Example 5: Determining a suitable MA approximation
#Find MA approximation to hyperbolic decay series
N<-10^4  #pick N so large that mmse forecast error converged
r<-1/sqrt(1:N)
out<-DLAcfToAR(r[-1])
InnovationVariance<-out[nrow(out),3]
phi<-out[,1]
psi<-ARMAtoMA(ar=phi, lag.max=N)
Error<-r[1]-InnovationVariance*(1+sum(psi^2))



