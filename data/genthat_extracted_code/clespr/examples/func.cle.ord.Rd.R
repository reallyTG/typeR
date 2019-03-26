library(clespr)


### Name: func.cle.ord
### Title: Composite Likelihood Estimation for Spatial Ordinal Data
### Aliases: func.cle.ord

### ** Examples

# Example of n.cat = 3 (Spatial ordinal regression)
# True parameter
vec.cutoff <- 2; vec.beta <- c(1, 2, 1, 0, -1); sigmasq <- 0.8; rho <- 0.6; radius <- 5
vec.par <- c(vec.cutoff, vec.beta, sigmasq, rho)

# Coordinate matrix
n.cat <- 3; n.lati <- 30; n.long <- 30
n.site <- n.lati * n.long
mat.lattice <- cbind(rep(1:n.lati, n.long), rep(1:n.long, each=n.lati))
mat.dist <- as.matrix(dist(mat.lattice, upper=TRUE, diag=TRUE))
mat.cov <- sigmasq * rho^mat.dist

set.seed(1228)
# Generate regression (design) matrix with intercept
mat.X <- cbind(rep(1, n.site),scale(matrix(rnorm(n.site*(length(vec.beta)-1)),nrow=n.site)))
vec.Z <- t(chol(mat.cov)) %*% rnorm(n.site) + mat.X %*% vec.beta
vec.epsilon <- diag(sqrt(1-sigmasq), n.site) %*% rnorm(n.site)
vec.ylat <- as.numeric(vec.Z + vec.epsilon)

# Convert to the vector of observation
vec.yobs <- func.obs.ord(vec.ylat, vec.alpha=c(-Inf,0,vec.cutoff,Inf))

# With parallel computing

## Not run: 
##D ord.example <- func.cle.ord(vec.yobs, mat.X, mat.lattice, radius, n.cat,
##D n.sim=100, parallel = TRUE, n.core = 2)
##D 
##D round(ord.example$vec.par,4)
##D # alpha1   beta0   beta1   beta2   beta3   beta4 sigma^2     rho
##D # 1.8395  0.9550  1.9690  0.9565  0.0349 -1.0398  0.8200  0.5578
##D 
##D round(ord.example$vec.se,4)
##D # alpha1   beta0   beta1   beta2   beta3   beta4 sigma^2     rho
##D # 0.1602  0.1222  0.1463  0.0916  0.0485  0.0889  0.1935  0.1267
## End(Not run)

# Without parallel computing

## Not run: 
##D ord.example2 <- func.cle.ord(vec.yobs, mat.X, mat.lattice, radius,
##D n.cat, n.sim=100, parallel = FALSE)
## End(Not run)

# Example for n.cat = 2 (i.e. Spatial probit regression)
# True parameter
vec.beta <- c(1, 2, 1, 0, -1); sigmasq <- 0.5; rho <- 0.6; radius <- 5
vec.par <- c(vec.beta, sigmasq, rho)

# Coordinate matrix
n.cat <- 2 ; n.lati <- n.long <- 40
n.site <- n.lati * n.long
mat.lattice <- cbind(rep(1:n.lati, n.long), rep(1:n.long, each=n.lati))
mat.dist <- as.matrix(dist(mat.lattice, upper=TRUE, diag=TRUE))
mat.cov <- sigmasq * rho^mat.dist

set.seed(123)
# Generate regression (design) matrix with intercept
mat.X <- cbind(rep(1, n.site),scale(matrix(rnorm(n.site*(length(vec.beta)-1)),nrow=n.site)))
vec.Z <- t(chol(mat.cov)) %*% rnorm(n.site) + mat.X %*% vec.beta
vec.epsilon <- diag(sqrt(1-sigmasq), n.site) %*% rnorm(n.site)
vec.ylat <- as.numeric(vec.Z + vec.epsilon)
# Convert to the vector of observation
vec.yobs <- func.obs.ord(vec.ylat, vec.alpha=c(-Inf,0,Inf))

## Not run: 
##D probit.example <- func.cle.ord(vec.yobs, mat.X, mat.lattice, radius, n.cat,
##D n.sim=100, parallel = TRUE, n.core = 4)
##D 
##D round(probit.example$vec.par,4)
##D # beta0   beta1   beta2   beta3   beta4 sigma^2     rho
##D # 1.0427  2.2250  1.0422  0.0156 -1.1489  0.4402  0.6636
##D 
##D round(probit.example$vec.se,4)
##D # beta0   beta1   beta2   beta3   beta4 sigma^2     rho
##D # 0.1198  0.1413  0.0863  0.0523  0.0935  0.1600  0.1263
## End(Not run)





