library(clespr)


### Name: func.obs.prop
### Title: Latent Response Transformation for Proportional Data
### Aliases: func.obs.prop

### ** Examples


# A simple example for observation generation
a <- sample(c(0,1), 50, replace=TRUE)
b <- sample(runif(1000,0,10), 100, replace=TRUE)
alpha <- 4
vec.yobs <- func.obs.prop(vec.ylat=c(a, b), alpha=alpha)

# A complex example
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



