library(BSSasymp)


### Name: ASCOV_SOBI
### Title: Asymptotic covariance matrix of symmetric and deflation-based
###   SOBI estimates
### Aliases: ASCOV_SOBI ASCOV_SOBIdefl
### Keywords: multivariate ts

### ** Examples


A<- matrix(rnorm(9),3,3)
psi1 <- ARMAtoMA(ar=0.6, lag.max=100)
psi2 <- ARMAtoMA(ar=c(0.2,0.3,-0.3),lag.max=100)
psi3 <- ARMAtoMA(ar=-0.2, ma=c(0.5,-0.1,0.4), lag.max=100)
psi <- cbind(psi1,psi2,psi3)

sym <- ASCOV_SOBI(psi=psi, taus=1:10, A=A)
defl <- ASCOV_SOBIdefl(psi=psi, taus=1:10, A=A)

round(sym$COV_W,2)
round(defl$COV_W,2)

sym$EMD
defl$EMD



