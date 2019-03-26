library(fdadensity)


### Name: MakeLQDsample
### Title: Convenience function for converting densities to log-quantile
###   densities
### Aliases: MakeLQDsample

### ** Examples

 

x <- seq(0,1,length.out = 101)
# some log quantile densities on (0, 1)
y <- t(sapply(seq(0.5, 1.5, length.out = 10), function(b) -log(b^2 + 4*(1-b)*x)/2)) 

# Get densities

y.dens = MakeDENsample(qmatrix = y, lqdSup = x, dSup = x)$DEN
matplot(x, t(y.dens), ylab = 'Density', type = 'l', lty = 1, col = 'black')

# Get LQDs Back

y.lqd = MakeLQDsample(y.dens, lqdSup = x, dSup = x)
# These should match
matplot(y.lqd$lqdSup, t(y.lqd$LQD), ylab = 'LQD', type = 'l', lty = 1, col = 'blue')
matplot(x, t(y), ylab = 'LQD', type = 'l', lty = 1, col = 'red')




