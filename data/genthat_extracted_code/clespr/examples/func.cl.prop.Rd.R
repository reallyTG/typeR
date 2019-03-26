library(clespr)


### Name: func.cl.prop
### Title: Composite Likelihood Calculation for Spatial Proportional Data
### Aliases: func.cl.prop

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

# Use func.cl.prop()
ls <- func.cl.prop(vec.yobs, mat.X, mat.lattice, radius, vec.par)
ls$log.lkd



