library(AF)


### Name: AF.cs
### Title: Attributable fraction for cross-sectional sampling designs.
###   NOTE! Deprecated function. Use 'AFglm'.
### Aliases: AF.cs

### ** Examples

# Simulate a cross-sectional sample
expit <- function(x) 1 / (1 + exp( - x))
n <- 1000
Z <- rnorm(n = n)
X <- rbinom(n = n, size = 1, prob = expit(Z))
Y <- rbinom(n = n, size = 1, prob = expit(Z + X))

# Example 1: non clustered data from a cross-sectional sampling design
data <- data.frame(Y, X, Z)

# Estimation of the attributable fraction
AF.cs_est <- AF.cs(formula = Y ~ X + Z + X * Z, data = data, exposure = "X")
summary(AF.cs_est)

# Example 2: clustered data from a cross-sectional sampling design
# Duplicate observations in order to create clustered data
id <- rep(1:n, 2)
data <- data.frame(id = id, Y = c(Y, Y), X = c(X, X), Z = c(Z, Z))

# Estimation of the attributable fraction
AF.cs_clust <- AF.cs(formula = Y ~ X + Z + X * Z, data = data,
                         exposure = "X", clusterid = "id")
summary(AF.cs_clust)



