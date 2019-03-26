library(stilt)


### Name: sep.cov
### Title: Construct time and parameter covariance matrices
### Aliases: sep.cov

### ** Examples

# Construct time AR(1) and square exponential separable parameter
# covariance matrix for a simple 1D parameter ensemble output example
data(Data.1D.par)
data(Data.1D.model)

Theta.mat.1D <- t(Data.1D.par$par)
t.vec.1D     <- Data.1D.model$t

# Use lag-1 time autocorrelation of 0.9, nugget and parameter covariance
# scaling factor of 100, and range of 3.
cov <- sep.cov(Theta.mat.1D, t.vec.1D, 0.9, 100, 3, 100)

# Find the covariance between second parameter setting (Theta=1) and
# ninth parameter setting (Theta=8)
cov.2.9 <- cov$Sigma.theta.mat[2,9]
cat("Covariance between Theta=1 and Theta=8 is:", cov.2.9, "\n")

# Plot the time covariance matrix [for fun]
# Note how covariance is high between similar years, but is low for markedly
# different years. Produces a pretty plot.
filled.contour(t.vec.1D, t.vec.1D, cov$Sigma.t.mat, xlab="Year", ylab="Year")



