library(ngspatial)


### Name: autologistic
### Title: Fit a centered autologistic model using maximum pseudolikelihood
###   estimation or MCMC for Bayesian inference.
### Aliases: autologistic

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
col1 = "white"
col2 = "black"
colfunc = colorRampPalette(c(col1, col2))

# Simulate a dataset with the above mentioned regression component and eta equal to 0.6. This
# value of eta corresponds to dependence that is moderate in strength.

theta = c(beta, eta = 0.6)
set.seed(123456)
Z = rautologistic(X, A, theta)

# Find the MPLE, and do not compute confidence intervals.

fit = autologistic(Z ~ X - 1, A = A, control = list(confint = "none"))
summary(fit)

# The following examples are not executed by default since the computation is time consuming.

# Compute confidence intervals based on the normal approximation. Estimate the "filling" in the
# sandwich matrix using a parallel parametric bootstrap, where the computation is distributed
# across six cores on the host workstation.

# set.seed(123456)
# fit = autologistic(Z ~ X - 1, A = A, verbose = TRUE,
#                   control = list(confint = "sandwich", nodes = 6))
# summary(fit)

# Compute confidence intervals based on a parallel parametric bootstrap. Use a bootstrap sample
# of size 500, and distribute the computation across six cores on the host workstation.

# set.seed(123456)
# fit = autologistic(Z ~ X - 1, A = A, verbose = TRUE,
#                   control = list(confint = "bootstrap", bootit = 500, nodes = 6))
# summary(fit)

# Do MCMC for Bayesian inference. The length of the training run will be 10,000, and
# the length of the subsequent inferential run will be at least 10,000.

# set.seed(123456)
# fit = autologistic(Z ~ X - 1, A = A, verbose = TRUE, method = "Bayes",
#                   control = list(trainit = 10000, minit = 10000, sigma = 1000))
# summary(fit)



