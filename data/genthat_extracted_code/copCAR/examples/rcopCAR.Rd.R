library(copCAR)


### Name: rcopCAR
### Title: Simulate areal data.
### Aliases: rcopCAR

### ** Examples


# Use the 20 x 20 square lattice as the underlying graph.

m = 20
A = adjacency.matrix(m)

# Create a design matrix by assigning coordinates to each vertex
# such that the coordinates are restricted to the unit square.

x = rep(0:(m - 1) / (m - 1), times = m)
y = rep(0:(m - 1) / (m - 1), each = m)
X = cbind(x, y)

# Set the dependence parameter and regression coefficients.

rho = 0.995      # strong dependence
beta = c(1, 1)   # the mean surface increases in the direction of (1, 1)

# Simulate Poisson data from the corresponding copCAR model.

z = rcopCAR(rho, beta, X, A, family = poisson(link = "log"))

# Simulate Bernoulli outcomes.

Z = rcopCAR(rho, beta, X, A, family = binomial(link = "logit"))

# Set the dispersion parameter.

theta = 10

# Simulate negative binomial outcomes.

Z = rcopCAR(rho, beta, X, A, family = negbinomial(theta))



