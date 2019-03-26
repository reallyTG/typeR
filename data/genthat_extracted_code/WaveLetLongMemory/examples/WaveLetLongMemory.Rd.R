library(WaveLetLongMemory)


### Name: Wavelet
### Title: Estimating Long Memory using wavelets
### Aliases: WVLM

### ** Examples

## Simulating Long Memory Series
N <- 1000
PHI <- 0.2
THETA <- 0.1
SD <- 1
M <- 0
D <- 0.2
Seed <- 123

set.seed(Seed)
Sim.Series <- fracdiff::fracdiff.sim(n = N, ar = c(PHI), ma = c(THETA),
d = D, rand.gen = rnorm, sd = SD, mu = M)

Yt <- as.ts(Sim.Series$series)

## GPH Estimation
WVLM(Method="GPH",Xt=Yt,bandwidth = 0.5)

## SEMIPARAMETRIC Estimation
WVLM(Method="SEMIPARAMETRIC",Xt=Yt,bandwidth = 0.5,BetaLagParzen = 0.2)

## WAVELET Estimation using different filtertype
WVLM(Method="WAVELET",Xt=Yt,typeWvtrans = "modwt",filtertype = "haar")
WVLM(Method="WAVELET",Xt=Yt,typeWvtrans = "modwt",filtertype = "d6")
WVLM(Method="WAVELET",Xt=Yt,typeWvtrans = "modwt",filtertype = "s8")



