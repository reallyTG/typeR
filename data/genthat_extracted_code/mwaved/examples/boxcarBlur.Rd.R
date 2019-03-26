library(mwaved)


### Name: boxcarBlur
### Title: Multichannel box car blur
### Aliases: boxcarBlur

### ** Examples

n <- 1024
width <- 1/sqrt(c(89,353))

# Plot the box car blur
blurMat <- boxcarBlur(n, width)
x <- (1:n)/n
matplot(x, blurMat, type = 'l', main = paste('Set of box car blur functions'))

# Plot a LIDAR signal and its multichannel box car blurred version
signal <- makeLIDAR(n)
matplot(x, signal, type = 'l', main = 'LIDAR test signal')
blurredSignal <- blurSignal(signal, blurMat)
matplot(x, blurredSignal, type = 'l', main = 'Box car blurred LIDAR test signals')



