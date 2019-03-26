library(Umpire)


### Name: MVN-class
### Title: The "MVN" Class
### Aliases: MVN-class MVN alterMean,MVN-method alterSD,MVN-method
###   nrow,MVN-method rand,MVN-method summary,MVN-method covar correl
### Keywords: datagen classes distribution

### ** Examples

showClass("MVN")
  ## Not run: 
##D tolerance <- 1e-10
##D ## Create a random orthogonal 2x2 matrix
##D a <- runif(1)
##D b <- sqrt(1-a^2)
##D X <- matrix(c(a, b, -b, a), 2, 2)
##D ## Now choose random positive squared-eigenvalues
##D Lambda2 <- diag(rev(sort(rexp(2))), 2)
##D ## Construct a covariance matrix
##D Y <- t(X) ##D 
##D ## Use the MVN constructor
##D marvin <- MVN(c(0,0), Y)
##D ## Check the four assertions
##D print(paste('Tolerance for assertion checking:', tolerance))
##D print(paste('Covar  assertion 1:',
##D             all(abs(covar(marvin) - Y) < tolerance)))
##D mar2 <- alterMean(marvin, normalOffset, delta=3)
##D print(paste('Covar  assertion 2:',
##D             all(abs(covar(marvin) - covar(mar2)) < tolerance)))
##D print(paste('Correl assertion 1:',
##D             all(abs(diag(correl(marvin)) - 1) < tolerance)))
##D mar3 <- alterSD(marvin, function(x) 2*x)
##D print(paste('Correl assertion 1:',
##D             all(abs(correl(marvin) - correl(mar2)) < tolerance)))
##D rm(a, b, X, Lambda2, Y, marvin, mar2, mar3)
##D   
## End(Not run)



