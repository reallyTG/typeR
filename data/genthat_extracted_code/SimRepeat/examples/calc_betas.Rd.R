library(SimRepeat)


### Name: calc_betas
### Title: Calculate Beta Coefficients for Correlated Systems of Continuous
###   Variables
### Aliases: calc_betas
### Keywords: Beasley Headrick continuous mixture

### ** Examples

# Example: system of three equations for 2 independent variables, where each
# error term has unit variance, from Headrick & Beasley (2002)
corr.yx <- list(matrix(c(0.4, 0.4), 1), matrix(c(0.5, 0.5), 1),
  matrix(c(0.6, 0.6), 1))
corr.x <- list()
corr.x[[1]] <- corr.x[[2]] <- corr.x[[3]] <- list()
corr.x[[1]][[1]] <- matrix(c(1, 0.1, 0.1, 1), 2, 2)
corr.x[[1]][[2]] <- matrix(c(0.1974318, 0.1859656, 0.1879483, 0.1858601),
  2, 2, byrow = TRUE)
corr.x[[1]][[3]] <- matrix(c(0.2873190, 0.2589830, 0.2682057, 0.2589542),
  2, 2, byrow = TRUE)
corr.x[[2]][[1]] <- t(corr.x[[1]][[2]])
corr.x[[2]][[2]] <- matrix(c(1, 0.35, 0.35, 1), 2, 2)
corr.x[[2]][[3]] <- matrix(c(0.5723303, 0.4883054, 0.5004441, 0.4841808),
  2, 2, byrow = TRUE)
corr.x[[3]][[1]] <- t(corr.x[[1]][[3]])
corr.x[[3]][[2]] <- t(corr.x[[2]][[3]])
corr.x[[3]][[3]] <- matrix(c(1, 0.7, 0.7, 1), 2, 2)
vars <- list(rep(1, 3), rep(1, 3), rep(1, 3))
calc_betas(corr.yx, corr.x, vars)




