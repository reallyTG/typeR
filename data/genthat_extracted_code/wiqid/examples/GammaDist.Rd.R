library(wiqid)


### Name: GammaDist
### Title: The Gamma Distribution
### Aliases: GammaDist dgamma2 pgamma2 qgamma2 rgamma2 getGammaPar
### Keywords: "distribution"

### ** Examples

# Plot some curves with dgamma2
xx <- seq(0, 20, length.out=101)
plot(xx, dgamma2(xx, 5, 1), xlab="x", ylab="Probability density",
  main="Gamma curves with mean = 5", type='l', lwd=2)
lines(xx, dgamma2(xx, 5, 2), col='darkgreen', lwd=2)
lines(xx, dgamma2(xx, 5, 4), col='red', lwd=2)
lines(xx, dgamma2(xx, 5, 8), col='blue', lwd=2)
abline(v=5, lty=3, lwd=2)
legend('topright', paste("sd =", c(1,2,4,8)), lwd=2,
  col=c('black', 'darkgreen', 'red', 'blue'), bty='n')

# Cumulative plots with pgamma2
plot(xx, pgamma2(xx, 5, 1), xlab="x", ylab="Cumulative probability",
  main="Gamma curves with mean = 5", type='l', lwd=2)
lines(xx, pgamma2(xx, 5, 2), col='darkgreen', lwd=2)
lines(xx, pgamma2(xx, 5, 4), col='red', lwd=2)
lines(xx, pgamma2(xx, 5, 8), col='blue', lwd=2)
abline(v=5, lty=3, lwd=2)
legend('bottomright', paste("sd =", c(1,2,4,8)), lwd=2,
  col=c('black', 'darkgreen', 'red', 'blue'), bty='n')

# Generate random draws and plot a histogram
rnd <- rgamma2(1e5, 5, 2)
hist(rnd, freq=FALSE)
# Add the curve:
lines(xx, dgamma2(xx, 5, 2), col='darkgreen', lwd=2)

# Get shape and rate parameters for mean = 5 and sd = c(1,2,4,8)
getGammaPar(mean = 5, sd = c(1,2,4,8))




