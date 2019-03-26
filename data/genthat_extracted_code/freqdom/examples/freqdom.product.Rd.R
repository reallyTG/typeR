library(freqdom)


### Name: freqdom.product
### Title: Compute a matrix product of two frequency-domain operators
### Aliases: freqdom.product
### Keywords: internal

### ** Examples

n = 100
X = rar(n)
Y = rar(n)
SX = spectral.density(X)
SY = spectral.density(Y)
R = freqdom.product(SY,SX)



