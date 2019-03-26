library(tweedie)


### Name: dtweedie.saddle
### Title: Tweedie Distributions (saddlepoint approximation)
### Aliases: dtweedie.saddle
### Keywords: models

### ** Examples

p <- 2.5
mu <- 1
phi <- 1
y <- seq(0, 10, length=100)
fy <- dtweedie( y=y, power=p, mu=mu, phi=phi)
plot(y, fy, type="l")
# Compare to the saddlepoint density
f.saddle <- dtweedie.saddle( y=y, power=p, mu=mu, phi=phi)
lines( y, f.saddle, col=2 )



