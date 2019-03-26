library(mwaved)


### Name: blurSignal
### Title: Blur an input signal
### Aliases: blurSignal

### ** Examples

n <- 1024
m <- 3
blur <- gammaBlur(n, shape = seq(from = 0.5, to = 1, length = m), scale = rep(0.25, m))
x <- (1:n)/n
signal <- makeLIDAR(n)
par(mfrow = c(2,1))
plot(x, signal, type = 'l', main = 'Direct LIDAR signal')
indirectSignal <- blurSignal(signal, blur)
matplot(x, indirectSignal, type = 'l', main = 'Set of blurred LIDAR signals')




