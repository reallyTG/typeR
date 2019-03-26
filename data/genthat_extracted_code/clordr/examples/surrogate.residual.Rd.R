library(clordr)


### Name: surrogate.residual
### Title: Surrogate Residuals for Replciations of Spatial Ordinal Data
### Aliases: surrogate.residual

### ** Examples

set.seed(1228)
n.subject <- 50
n.lat <- n.lon <- 10
n.site <- n.lat*n.lon

beta <- c(1,2,-1) # First 1 here is the intercept
midalpha <- c(1.15, 2.18) ; phi <- 0.6 ; sigma2 <- 0.7

true <- c(midalpha,beta,phi,sigma2)

Xi <- rnorm(n.subject,0,1) ; Xj <- rbinom(n.site,1,0.6)

 VV <- matrix(NA, nrow = n.subject*n.site, ncol = 3)

 for(i in 1:n.subject){ for(j in 1:n.site){
     VV[(i-1)*n.site+j,] <- c(1,Xi[i],Xj[j])
       }
 }

location <- cbind(rep(seq(1,n.lat,length=n.lat),n.lat),rep(1:n.lon, each=n.lon))
response <- sim.rord(n.subject, n.site, n.rep = 1,
midalpha, beta, phi, sigma2, covar=VV, location)[[1]]

## Not run: 
##D # Example for linearity of covariate
##D sur.resid <- surrogate.residual(response, covar=VV, location, seed =1,
##D midalpha, beta, sigma2, phi,
##D burn.in=20, output = TRUE)
##D 
##D scatter.smooth(rep(Xi,each=n.site),c(sur.resid),
##D main="Surrogate residual against Xi", xlab="Xi", ylab="Surrogate residual",
##D lpars = list(col = "red", lwd = 3, lty = 2))
##D 
##D abline(h=0, col="blue")
## End(Not run)




