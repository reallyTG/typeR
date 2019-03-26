library(factorstochvol)


### Name: runningcovmat
### Title: Extract summary statistics for the posterior covariance matrix
###   which have been stored during sampling
### Aliases: runningcovmat

### ** Examples

## Not run: 
##D set.seed(1)
##D sim <- fsvsim(n = 500, series = 3, factors = 1) # simulate 
##D res <- fsvsample(sim$y, factors = 1, runningstore = 6) # estimate
##D 
##D cov100mean <- runningcovmat(res, 100) # extract mean at t = 100
##D cov100sd <- runningcovmat(res, 100, statistic = "sd") # extract sd
##D lower <- cov100mean - 2*cov100sd
##D upper <- cov100mean + 2*cov100sd
##D 
##D true <- covmat(sim, 100) # true value
##D 
##D # Visualize mean +/- 2sd and data generating values
##D par(mfrow = c(3,3), mar = c(2, 2, 2, 2))
##D for (i in 1:3) {
##D  for (j in 1:3) {
##D   plot(cov100mean[i,j], ylim = range(lower, upper), pch = 3,
##D   main = paste(i, j, sep = ' vs. '), xlab = '', ylab = '')
##D   lines(c(1,1), c(lower[i,j], upper[i,j]))
##D   points(true[i,j,1], col = 3, cex = 2)
##D  }
##D }
## End(Not run)




