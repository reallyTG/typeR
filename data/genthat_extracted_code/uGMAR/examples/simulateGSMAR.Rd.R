library(uGMAR)


### Name: simulateGSMAR
### Title: Simulate values from GMAR, StMAR or G-StMAR process
### Aliases: simulateGSMAR

### ** Examples

 ## No test: 
 # GMAR model
 params13 <- c(1.4, 0.88, 0.26, 2.46, 0.82, 0.74, 5.0, 0.68, 5.2, 0.72, 0.2)
 gmar13 <- GSMAR(p=1, M=3, params=params13, model="GMAR")
 sim13 <- simulateGSMAR(gmar13, nsimu=500)
 ts.plot(sim13$sample)
 ts.plot(sim13$component)
 ts.plot(sim13$mixingWeights, col=rainbow(3), lty=2)

 # Restricted GMAR model
 params12r <- c(1.4, 1.8, 0.88, 0.29, 3.18, 0.84)
 gmar12r <- GSMAR(p=1, M=2, params=params12r, model="GMAR",
 restricted=TRUE)
 sim12r <- simulateGSMAR(gmar12r, nsimu=500)
 ts.plot(sim12r$sample)
 ts.plot(sim12r$component)
 ts.plot(sim12r$mixingWeights, col=rainbow(3), lty=2)

 # G-StMAR model, with initial values
 params12gs <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 3.6)
 gstmar12 <- GSMAR(p=1, M=c(1, 1), params=params12gs,
 model="G-StMAR")
 sim12gs <- simulateGSMAR(gstmar12, nsimu=500, initvalues=5:6)
 ts.plot(sim12gs$sample)
 ts.plot(sim12gs$component)
 ts.plot(sim12gs$mixingWeights, col=rainbow(3), lty=2)

 # Such StMAR(3,2) that the AR coefficients are restricted to be
 # the same for both regimes and that the second AR coefficients are
 # constrained to zero.
 params32trc <- c(2.2, 1.8, 0.88, -0.03, 2.4, 0.27, 0.40, 3.9, 1000)
 stmar32rc <- GSMAR(data=VIX, p=3, M=2, params=params32trc, model="StMAR",
  restricted=TRUE, constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))
 sim32trc <- simulateGSMAR(stmar32rc, nsimu=500)
 ts.plot(sim32trc$sample)
 ts.plot(sim32trc$component)
 ts.plot(sim32trc$mixingWeights, col=rainbow(3), lty=2)

 # Mixture version of Heterogenuous Autoregressive (HAR) model (without data)
 paramsHAR <- c(1, 0.1, 0.2, 0.3, 1, 1, 0.15, 0.25, 0.35, 1, 0.55)
 r1 = c(1, rep(0, 21)); r2 = c(rep(0.2, 5), rep(0, 17)); r3 = rep(1/22, 22)
 R0 = cbind(r1, r2, r3)
 mixhar <- GSMAR(p=22, M=2, params=paramsHAR, model="GMAR", constraints=list(R0, R0))
 simhar <- simulateGSMAR(mixhar, nsimu=1000)
 ts.plot(simhar$sample)
 ts.plot(simhar$component)
 ts.plot(simhar$mixingWeights, col=rainbow(3), lty=2)
## End(No test)



