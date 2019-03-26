library(fdadensity)


### Name: getWFmean
### Title: Wasserstein Frechet Mean Computation
### Aliases: getWFmean

### ** Examples

x <- seq(0,1,length.out = 101)
# linear densities on (0, 1)
y <- t(sapply(seq(0.5, 1.5, length.out = 10), function(b) b + 2*(1 - b)*x)) 
wfmean = getWFmean(y, x)

# Plot WF mean with Euclidean Mean
matplot(x, t(y), ylab = 'Density', type = 'l', lty = 1, col = 'black')
lines(x, wfmean, lwd = 2, col = 'red')
lines(x, colMeans(y), lwd = 2, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), lwd = c(1, 2, 2), 
           legend = c('Densities', 'WF Mean', 'Euclidean Mean'))




