library(NetworkRiskMeasures)


### Name: matrix_estimation
### Title: Matrix Estimation
### Aliases: matrix_estimation matrix_estimation max_ent matrix_estimation
###   min_dens

### ** Examples

# Example from Anand, Craig and Von Peter (2015, p.628)

# Liabilities
L <- c(a = 4, b = 5, c = 5, d = 0, e = 0, f = 2, g = 4)

# Assets
A <- c(a = 7, b = 5, c = 3, d = 1, e = 3, f = 0, g = 1)

# Maximum Entropy
ME <- matrix_estimation(A, L, method = "me")
ME <- round(ME, 2)

# Minimum Density
set.seed(192)
MD <- matrix_estimation(A, L, method = "md")




