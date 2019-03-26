library(mixAK)


### Name: TMVN
### Title: Truncated multivariate normal distribution
### Aliases: TMVN rTMVN C_rTMVN1_R
### Keywords: distribution multivariate

### ** Examples

## Not run: 
##D set.seed(1977)
##D 
##D exam2 <- function(n, mu, sigma, rho, a, b, trunc)
##D {
##D   Sigma <- matrix(c(sigma[1]^2, rho*sigma[1]*sigma[2], rho*sigma[1]*sigma[2], sigma[2]^2), nrow=2)
##D   x <- rTMVN(n, mean=mu, Sigma=Sigma, a=a, b=b, trunc=trunc)
##D   x1.gr <- seq(mu[1]-3.5*sigma[1], mu[1]+3.5*sigma[1], length=100)
##D   x2.gr <- seq(mu[2]-3.5*sigma[2], mu[2]+3.5*sigma[2], length=100)    
##D   z <- cbind(rep(x1.gr, 100), rep(x2.gr, each=100))
##D   dens.z <- matrix(dMVN(z, mean=mu, Sigma=Sigma), ncol=100)
##D 
##D   MEAN <- round(apply(x, 2, mean), 3)
##D   SIGMA <- var(x)
##D   SD <- sqrt(diag(SIGMA))
##D   RHO <- round(SIGMA[1,2]/(SD[1]*SD[2]), 3)
##D   SD <- round(SD, 3)
##D   
##D   layout(matrix(c(0,1,1,0, 2,2,3,3), nrow=2, byrow=TRUE))
##D   contour(x1.gr, x2.gr, dens.z, col="darkblue", xlab="x[1]", ylab="x[2]")
##D   points(x[,1], x[,2], col="red")
##D   title(sub=paste("Sample mean = ", MEAN[1], ", ", MEAN[2], ",  Sample SD = ", SD[1], ", ", SD[2],
##D                   ",  Sample rho = ", RHO, sep=""))
##D   plot(1:n, x[,1], type="l", xlab="Iteration", ylab="x[1]", col="darkgreen")
##D   plot(1:n, x[,2], type="l", xlab="Iteration", ylab="x[2]", col="darkgreen")
##D 
##D   return(x)  
##D }  
##D 
##D x1 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0, a=c(-6, -9), b=c(4, 11), trunc=c(3, 3))
##D x2 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0.7, a=c(-6, -9), b=c(4, 11), trunc=c(3, 3))
##D x3 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0.7, a=c(-100, -100), b=c(100, 100),
##D             trunc=c(3, 3))
##D x4 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=-0.7, a=c(-6, -9), b=c(4, 11),
##D             trunc=c(3, 3))
##D x5 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=-0.9, a=c(-6, -9), b=c(4, 11),
##D             trunc=c(3, 3))
##D 
##D x6 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0.7, a=c(0, 0), trunc=c(0, 2))
##D x7 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0.7, a=c(-1, 1), trunc=c(0, 2))
##D x8 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0.7, a=c(-1, 1), trunc=c(1, 2))
##D x9 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0.7, a=c(-1.5, 0.5), b=c(-0.5, 1.5),
##D             trunc=c(3, 3))
##D x10 <- exam2(1000, mu=c(-1, 1), sigma=c(1, sqrt(2)), rho=0.7, a=c(-1.5, 0.5), b=c(-0.5, 1.5),
##D              trunc=c(4, 3))
## End(Not run)



