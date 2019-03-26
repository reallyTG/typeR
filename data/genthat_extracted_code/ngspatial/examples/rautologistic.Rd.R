library(ngspatial)


### Name: rautologistic
### Title: Return a perfect sample from a centered autologistic model.
### Aliases: rautologistic

### ** Examples


# Use the 20 x 20 square lattice as the underlying graph.

n = 20
A = adjacency.matrix(n)

# Assign coordinates to each vertex such that the coordinates are restricted to the unit square
# centered at the origin.

x = rep(0:(n - 1) / (n - 1), times = n) - 0.5
y = rep(0:(n - 1) / (n - 1), each = n) - 0.5
X = cbind(x, y)                                 # Use the vertex locations as spatial covariates.
beta = c(2, 2)                                  # These are the regression coefficients.

# Simulate a dataset with the above mentioned regression component and eta equal to 0.6. This
# value of eta corresponds to dependence that is moderate in strength.

theta = c(beta, eta = 0.6)
set.seed(123456)
Z = rautologistic(X, A, theta)



