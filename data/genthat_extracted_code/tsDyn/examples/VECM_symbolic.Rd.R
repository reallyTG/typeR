library(tsDyn)


### Name: VECM_symbolic
### Title: Virtua VECM model
### Aliases: VECM_symbolic
### Keywords: VECM cointegration ts

### ** Examples



 a<-matrix(c(-0.4, 0.1), ncol=1)
 b<-matrix(c(1, -2), ncol=2)

 # VECM_symb(alpha=a, beta=t(b))
 d<- VECM_symbolic(alpha=a, beta=t(b))
 VARrep(d)
 d<- VECM_symbolic(alpha=a, beta=t(b), lags=matrix(0, ncol=2, nrow=2))
 VARrep(d)
 LagMat <- matrix(c(0.1, 0.3, 0.1, 0.2), ncol=2, nrow=2)
 incMat <- matrix(c(0.5, 0.1), ncol=1)
 d3<- VECM_symbolic(alpha=a, beta=t(b), lags=LagMat, inc=incMat, include="const")
 VARrep(d3)





