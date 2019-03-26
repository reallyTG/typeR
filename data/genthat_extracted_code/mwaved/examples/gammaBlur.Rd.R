library(mwaved)


### Name: gammaBlur
### Title: Multichannel Gamma density blur
### Aliases: gammaBlur

### ** Examples

n <- 1024
m <- 3
shape <- seq(from = 0.5, to = 1, length = m)
scale <- rep(0.25,m)

# Plot the smooth (gamma) blur
x <- (1:n)/n
blurMat <- gammaBlur(n, shape, scale)
matplot(x, blurMat, type = 'l', main = paste('Set of Gamma', m,'Gamma blur densities.'))

# Plot a LIDAR signal and its multichannel smooth blurred version
signal <- makeLIDAR(n)
matplot(x, signal, type = 'l', main = 'LIDAR test signal')
blurredSignal <- blurSignal(signal, blurMat)
matplot(x, blurredSignal, type = 'l', main = 'Smooth blurred LIDAR test signals')



