library(freqdom)


### Name: fourier.transform
### Title: Computes the Fourier transformation of a filter given as
###   'timedom' object
### Aliases: fourier.transform
### Keywords: frequency.domain time.domain

### ** Examples

# We compute the discrete Fourier transform (DFT) of a time series X_1,..., X_T.

X = rar(100)
T=dim(X)[1]
tdX = timedom(X/sqrt(T),lags=1:T)
DFT = fourier.transform(tdX, freq= pi*-1000:1000/1000)



