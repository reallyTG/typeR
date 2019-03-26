library(onlinePCA)


### Name: create.basis
### Title: Create a smooth B-spline basis
### Aliases: create.basis

### ** Examples

n <- 100 # number of curves
d <- 500 # number of observation points
grid <- (1:d)/d # observation points
p <- 50 # number of B-spline basis functions 

# Simulate Brownian motion
x <- matrix(rnorm(n*d,sd=1/sqrt(d)),n,d)
x <- t(apply(x,1,cumsum))

# Create B-spline basis 
mybasis <- create.basis(grid, p, 1e-4)

# Compute smooth basis coefficients 
beta <- fd2coef(x, mybasis)

# Recover smooth functional data
x.smooth <- coef2fd(beta, mybasis) 
	
# Standard PCA and Functional PCA
pca <- prcomp(x)
fpca <- prcomp(beta)



