library(factorstochvol)


### Name: runningcormat
### Title: Extract summary statistics for the posterior correlation matrix
###   which have been stored during sampling
### Aliases: runningcormat

### ** Examples

## Not run: 
##D set.seed(1)
##D sim <- fsvsim(n = 500, series = 3, factors = 1) # simulate 
##D res <- fsvsample(sim$y, factors = 1, runningstore = 6) # estimate
##D 
##D cor100mean <- runningcormat(res, 100) # extract mean at t = 100
##D cor100sd <- runningcormat(res, 100, statistic = "sd") # extract sd
##D lower <- cor100mean - 2*cor100sd
##D upper <- cor100mean + 2*cor100sd
##D 
##D true <- cov2cor(covmat(sim, 100)[,,1]) # true value
##D 
##D # Visualize mean +/- 2sd and data generating values
##D par(mfrow = c(3,3), mar = c(2, 2, 2, 2))
##D for (i in 1:3) {
##D  for (j in 1:3) {
##D   plot(cor100mean[i,j], ylim = range(lower, upper), pch = 3,
##D   main = paste(i, j, sep = ' vs. '), xlab = '', ylab = '')
##D   lines(c(1,1), c(lower[i,j], upper[i,j]))
##D   points(true[i,j], col = 3, cex = 2)
##D  }
##D }
## End(Not run)




