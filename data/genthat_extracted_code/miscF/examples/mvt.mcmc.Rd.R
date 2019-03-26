library(miscF)


### Name: mvt.mcmc
### Title: Estimate Parameters of a Multivariate t Distribution Using the
###   MCMC
### Aliases: mvt.mcmc
### Keywords: multivariate

### ** Examples

## Not run: 
##D   mu1 <- mu2 <- sigma12 <- sigma22 <- 100
##D   rho12 <- 0.9
##D   Sigma <- matrix(c(sigma12, rho12*sqrt(sigma12*sigma22),
##D                     rho12*sqrt(sigma12*sigma22), sigma22),
##D                   nrow=2)
##D   k <- 8
##D   N <- 100
##D   X <- rmvt(N, sigma=Sigma, df=k, delta=c(mu1, mu2))
##D 
##D   result <- mvt.mcmc(X, 4, 25)
##D   colMeans(result$Mu.save)
##D   apply(result$Sigma.save, c(1,2), mean)
##D   mean(result$v.save)
## End(Not run)



