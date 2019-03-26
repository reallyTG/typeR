library(DstarM)


### Name: estQdf
### Title: Estimate quantiles of distribution
### Aliases: estQdf

### ** Examples

x = seq(-9, 9, .1) # x-grid
d = dnorm(x) # density functions
p = seq(0, 1, .2) # probabilities of interest
cEst = estCdf(d) # estimate cumulative distribution functions
qEst = estQdf(p = p, x = x, cdf = cEst) # estimate quantiles
plot(x, cEst, bty = 'n', las = 1, type = 'l', ylab = 'Probability') # plot cdf
abline(h = p, v = qEst, col = 1:6, lty = 2) # add lines for p and for obtained quantiles
points(x = qEst, y = p, pch = 18, col = 1:6, cex = 1.75) # add points for intersections




