library(RZigZag)


### Name: ZigZagGaussian
### Title: ZigZagGaussian
### Aliases: ZigZagGaussian

### ** Examples

V <- matrix(c(3,1,1,3),nrow=2)
mu <- c(2,2)
x0 <- c(0,0)
result <- ZigZagGaussian(V, mu, 100, x0, n_samples = 10)
plot(result$skeletonPoints[1,], result$skeletonPoints[2,],type='l',asp=1)
points(result$samples[1,], result$samples[2,], col='magenta')



