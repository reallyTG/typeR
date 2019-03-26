library(clespr)


### Name: func.cle.prop
### Title: Composite Likelihood Estimation for Spatial Proportional Data
### Aliases: func.cle.prop

### ** Examples

# True parameter
alpha <- 4; vec.beta <- c(1, 2, 1, 0, -1); sigmasq <- 0.8; rho <- 0.6; radius <- 5
vec.par <- c(alpha, vec.beta, sigmasq, rho)

# Coordinate matrix
n.lati <- 30; n.long <- 30
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
vec.yobs <- func.obs.prop(vec.ylat, alpha=alpha)

# With parallel computing

## Not run: 
##D prop.example <- func.cle.prop(vec.yobs, mat.X, mat.lattice, radius,
##D n.sim=100, parallel = TRUE, n.core = 2)
##D 
##D round(prop.example$vec.par,4)
##D # alpha   beta0   beta1   beta2   beta3   beta4 sigma^2     rho
##D # 3.8259  0.9921  1.9679  0.9455  0.0148 -0.9871  0.8386  0.5761
##D 
##D round(prop.example$vec.se ,4)
##D # alpha   beta0   beta1   beta2   beta3   beta4 sigma^2     rho
##D # 0.1902  0.1406  0.1103  0.0744  0.0385  0.0652  0.1527  0.1151
## End(Not run)

# Without parallel computing

## Not run: 
##D prop.example2 <- func.cle.prop(vec.yobs, mat.X, mat.lattice, radius, n.sim=100, parallel = FALSE)
## End(Not run)




