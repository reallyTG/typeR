library(wiqid)


### Name: BetaDist
### Title: The Beta Distribution
### Aliases: BetaDist dbeta2 pbeta2 qbeta2 rbeta2 getBeta2Par dbeta3 pbeta3
###   qbeta3 rbeta3 getBeta3Par
### Keywords: "distribution"

### ** Examples

# Plot some curves with dbeta2
xx <- seq(0, 1, length.out=101)
plot(xx, dbeta2(xx, 0.4, 0.12), xlab="x", ylab="Probability density",
  main="Beta curves with mean = 0.4", type='l', lwd=2)
lines(xx, dbeta2(xx, 0.4, 0.24), col='darkgreen', lwd=2)
lines(xx, dbeta2(xx, 0.4, 0.28), col='red', lwd=2)
lines(xx, dbeta2(xx, 0.4, 0.36), col='blue', lwd=2)
abline(v=0.4, lty=3, lwd=2)
legend('topright', paste("sd =", c(0.12,0.24, 0.28, 0.36)), lwd=2,
  col=c('black', 'darkgreen', 'red', 'blue'), bty='n')

# Get shape and rate parameters for mean = 0.4 and sd = c(0.12,0.24, 0.28, 0.36, 0.49)
# The last value for sd is too big and will produce NAs and a warning
getBeta2Par(mean = 0.4, sd = c(0.12,0.24, 0.28, 0.36, 0.49))

# The parameterisation with mean and sd doesn't seem intuitive,
#   let's try mode and concentration.
# This does not allow 'bathtub' curves, which are bimodal.
plot(xx, dbeta3(xx, 0.4, 16), xlab="x", ylab="Probability density",
  main="Beta curves with mode = 0.4", type='l', lwd=2)
lines(xx, dbeta3(xx, 0.4, 8), col='darkgreen', lwd=2)
lines(xx, dbeta3(xx, 0.4, 4), col='red', lwd=2)
lines(xx, dbeta3(xx, 0.4, 2), col='blue', lwd=2)
abline(v=0.4, lty=3, lwd=2)
legend('topright', , lwd=2, paste("concentration =", c(16, 8, 4, 2)),
  col=c('black', 'darkgreen', 'red', 'blue'), bty='n')

# The mode can be at 0 or 1:
plot(xx, dbeta3(xx, 1, 16), xlab="x", ylab="Probability density",
  main="Beta curves with mode = 1", type='l', lwd=2)
lines(xx, dbeta3(xx, 1, 8), col='darkgreen', lwd=2)
lines(xx, dbeta3(xx, 1, 4), col='red', lwd=2)
lines(xx, dbeta3(xx, 1, 2), col='blue', lwd=2)
legend('topleft', paste("concentration =", c(16, 8, 4, 2)), lwd=2,
  col=c('black', 'darkgreen', 'red', 'blue'), bty='n')

# Cumulative plots with pbeta3
plot(xx, pbeta3(xx, 0.4, 16), xlab="x", ylab="Cumulative probability",
  main="Beta curves with mode = 0.4", type='l', lwd=2)
lines(xx, pbeta3(xx, 0.4, 8), col='darkgreen', lwd=2)
lines(xx, pbeta3(xx, 0.4, 4), col='red', lwd=2)
lines(xx, pbeta3(xx, 0.4, 2), col='blue', lwd=2)
abline(v=0.4, lty=3, lwd=2)
legend('topleft', paste("concentration =", c(16, 8, 4, 2)), lwd=2,
  col=c('black', 'darkgreen', 'red', 'blue'), bty='n')

# Generate random draws and plot a histogram
rnd <- rbeta3(1e5, 0.4, 8)
hist(rnd, freq=FALSE)
# Add the curve:
lines(xx, dbeta3(xx, 0.4, 8), col='darkgreen', lwd=2)

# Get shape and rate parameters for mode = 0.4 and concentration = c(2, 4, 8, 16)
getBeta3Par(mode = 0.4, concentration = c(2, 4, 8, 16))




