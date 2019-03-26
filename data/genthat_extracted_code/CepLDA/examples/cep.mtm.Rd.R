library(CepLDA)


### Name: cep.mtm
### Title: Multitaper Estimation of Cepstral Coefficients and the
###   Log-Spectrum
### Aliases: cep.mtm

### ** Examples

## simulate a time series
N = 500 #length of each series
dat <- r.cond.ar2(N=N,nj=1,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))$X

## Fit multiaper
cep <- cep.mtm(dat)

## Plot the cepstral coefficients
plot(cep$quef, cep$cep)

## Plot the log spectrum
plot(cep$freq, cep$lspec, type="l")



