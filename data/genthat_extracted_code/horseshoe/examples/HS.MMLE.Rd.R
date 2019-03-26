library(horseshoe)


### Name: HS.MMLE
### Title: MMLE for the horseshoe prior for the sparse normal means
###   problem.
### Aliases: HS.MMLE

### ** Examples

## Not run: 
##D #Example with 5 signals, rest is noise
##D truth <- c(rep(0, 95), rep(8, 5))
##D y <-  truth + rnorm(100)
##D (tau.hat <- HS.MMLE(y, 1)) #returns estimate of tau
##D plot(y, HS.post.mean(y, tau.hat, 1)) #plot estimates against the data
## End(Not run)
## Not run: 
##D #Example where the data variance is estimated first
##D truth <- c(rep(0, 950), rep(8, 50))
##D y <-  truth + rnorm(100, mean = 0, sd = sqrt(2))
##D sigma2.hat <- var(y)
##D (tau.hat <- HS.MMLE(y, sigma2.hat)) #returns estimate of tau
##D plot(y, HS.post.mean(y, tau.hat, sigma2.hat)) #plot estimates against the data
## End(Not run)




