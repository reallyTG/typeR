library(mwaved)


### Name: sigmaSNR
### Title: Determine noise scale levels from specified *S*ignal to *N*oise
###   *R*atios
### Aliases: sigmaSNR

### ** Examples

n <- 1024
m <- 3
signal <- makeLIDAR(n)
blur <- gammaBlur(n, c(0.5, 0.75, 1), rep(1, m))
X <- blurSignal(signal, blur)
SNR <- 10*1:3
sigma <- sigmaSNR(X, SNR)
E <- multiNoise(n, sigma)
sigmaEst <- multiSigma(E)



