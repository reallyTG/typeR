library(spam)


### Name: covmat
### Title: Covariance functions
### Aliases: covmat cov.exp cov.sph cov.nug cov.wu1 cov.wu2 cov.wu3
###   cov.wend1 cov.wend2 cov.mat
### Keywords: algebra

### ** Examples

locs <- cbind(runif(10),runif(10))
h <- nearest.dist(locs, delta=.3)
Sigma <- cov.sph(h, c(.3, 1, .1))

## Not run: 
##D h <- seq(0, to=1, length.out=100)
##D plot( h, cov.exp(h, c(1/3,1)), type='l', ylim=c(0,1))
##D type <- c("sph","wendland1","wendland2","wu1","wu2","wu3")
##D for (i in 1:6) 
##D   lines( h, covmat(h, 1, type=type[i]), col=i+1)
##D legend('topright',legend=type, col=2:7, lty=1)
##D 
## End(Not run)



