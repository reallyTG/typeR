library(yuima)


### Name: phi.test
### Title: Phi-divergence test statistic for stochastic differential
###   equations
### Aliases: phi.test
### Keywords: ts

### ** Examples

model<- setModel(drift="t1*(t2-x)",diffusion="t3")
T<-10
n<-1000
sampling <- setSampling(Terminal=T,n=n)
yuima<-setYuima(model=model, sampling=sampling)

h0 <- list(t1=0.3, t2=1, t3=0.25)
X <- simulate(yuima, xinit=1, true=h0)
h1 <- list(t1=0.3, t2=0.2, t3=0.1)

phi1 <- function(x) 1-x+x*log(x)

phi.test(X, H0=h0, H1=h1,phi=phi1)
phi.test(X, H0=h0, phi=phi1, start=h0, lower=list(t1=0.1, t2=0.1, t3=0.1), 
   upper=list(t1=2,t2=2,t3=2),method="L-BFGS-B")
phi.test(X, H0=h1, phi=phi1, start=h0, lower=list(t1=0.1, t2=0.1, t3=0.1), 
  upper=list(t1=2,t2=2,t3=2),method="L-BFGS-B")



