library(LongMemoryTS)


### Name: GSE
### Title: Multivariate local Whittle estimation of long memory parameters.
### Aliases: GSE

### ** Examples

T<-500
d1<-0.4
d2<-0.2
data<-FI.sim(T, q=2, rho=0.5, d=c(d1,d2))
ts.plot(data, col=1:2)
GSE(data, m=floor(1+T^0.7))



