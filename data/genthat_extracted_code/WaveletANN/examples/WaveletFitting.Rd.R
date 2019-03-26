library(WaveletANN)


### Name: WaveletFitting
### Title: Wavelet transform using Maximal overlap discrete wavelet
###   transform (MODWT) algorithm
### Aliases: WaveletFitting

### ** Examples


N <- 100
PHI <- 0.2
THETA <- 0.1
SD <- 1
M <- 0
D <- 0.2
Seed <- 123

set.seed(Seed)
Sim.Series <- fracdiff::fracdiff.sim(n = N, ar = c(PHI), ma = c(THETA),
                                     d = D, rand.gen = rnorm, sd = SD, mu = M)
simts <- as.ts(Sim.Series$series)
Waveletlevels <- floor(log(length(simts))) # to obtain the maximum level for wavelet decomposition
WS <- WaveletFitting(ts=simts,Wvlevels=Waveletlevels,bndry='periodic',FFlag=TRUE)$WaveletSeries



