library(fdadensity)


### Name: MakeDENsample
### Title: Convenience function for converting log quantile densities to
###   densities
### Aliases: MakeDENsample

### ** Examples

 

x <- seq(0,1,length.out = 101)
# linear densities on (0, 1)
y <- t(sapply(seq(0.5, 1.5, length.out = 10), function(b) b + 2*(1 - b)*x)) 

# Get LQDs

y.lqd = MakeLQDsample(dmatrix = y, dSup = x)
matplot(y.lqd$lqdSup, t(y.lqd$LQD), ylab = 'LQD', type = 'l', lty = 1, col = 'black')

# Get Densities Back

y.dens = MakeDENsample(y.lqd$LQD, lqdSup = x, dSup = x) # should equate to y above
# These should look the same
matplot(y.dens$dSup, t(y.dens$DEN), ylab = 'Density', type = 'l', lty = 1, col = 'blue')
matplot(x, t(y), ylab = 'Original Density', type = 'l', lty = 1, col = 'red')




