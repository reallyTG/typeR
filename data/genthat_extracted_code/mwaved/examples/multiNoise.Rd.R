library(mwaved)


### Name: multiNoise
### Title: Generate multichannel noise
### Aliases: multiNoise

### ** Examples

n <- 1024
m <- 3
signal <- makeLIDAR(n)
blur <- gammaBlur(n, c(0.5, 0.75, 1), rep(1, m))
X <- blurSignal(signal, blur)
SNR <- 10*1:3
sigma <- sigmaSNR(X, SNR)
E <- multiNoise(n, sigma, alpha = c(0.5, 0.75, 1))
matplot(X + E, type = 'l')



