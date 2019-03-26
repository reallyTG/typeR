library(AHR)


### Name: ahrKM
### Title: ahrKM
### Aliases: ahrKM

### ** Examples

T <- c(rexp(100, 1), rexp(100, 2))
C <- c(rexp(100, 1), rexp(100, 2))
Y <- pmin(T, C)
D <- T <= C
Z <- rep(c(0,1), c(100, 100)) # treatment indicator
fit <- ahrKM(2, Surv(Y, D) ~ Z, data.frame(Y=Y, D=D, Z=Z))
fit

## the same as above, but estimate covariance matrix using bootstrap
## Not run: 
##D fitBS <- ahrKM(2, Surv(Y, D) ~ Z, data.frame(Y=Y, D=D, Z=Z), cov=FALSE,
##D                          bootstrap=1000)
## End(Not run)



