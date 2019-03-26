library(LongMemoryTS)


### Name: G.hat
### Title: Estimation of G matrix for multivariate long memory processes.
### Aliases: G.hat

### ** Examples

T<-500
d1<-0.4
d2<-0.2
data<-FI.sim(T, q=2, rho=0, d=c(d1,d2))
G.hat(X=data, d=c(d1,d2), m=floor(1+T^0.6))
#diagonal elements should equal 1/(2*pi)



