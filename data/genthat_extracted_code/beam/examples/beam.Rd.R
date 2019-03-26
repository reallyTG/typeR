library(beam)


### Name: beam
### Title: Bayesian inference in large Gaussian graphical models
### Aliases: beam

### ** Examples


# Load data
data(TCPAprad)

# beam
fit <- beam(X = TCPAprad, type="both") 

# Print summary
summary(fit)

# Extract matrix of marginal correlations
mcor(fit)[1:5, 1:5]

# Extract matrix of partial correlations
pcor(fit)[1:5, 1:5]

# Plot log-marginal likelihood of the Gaussian conjugate model
plotML(fit)

# Plot heatmap of marginal (upper triangle) and/or
# partial (lower triangle) correlation estimates
plotCor(fit)




