library(clordr)


### Name: cle.rord
### Title: Composite Likelihood Estimation for Replciations of Spatial
###   Ordinal Data
### Aliases: cle.rord

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
sim.data <- sim.rord(n.subject, n.site, n.rep = 2, midalpha, beta, phi, sigma2, covar=VV, location)

## Not run: 
##D options(digits=3)
##D result <- cle.rord(response=sim.data[[1]], covar=VV,
##D           location ,radius = 4, n.sim = 100, output = TRUE, n.core = 4)
##D result$vec.par
##D # alpha2  alpha3   beta0   beta1   beta2     phi sigma^2
##D # 1.175   2.217   1.028   2.036  -1.053   0.586   0.681
##D 
##D result$vec.se
##D # alpha2  alpha3   beta0   beta1   beta2     phi sigma^2
##D # 0.0514  0.0873  0.0963  0.1144  0.0462  0.0281  0.0620
##D 
## End(Not run)




