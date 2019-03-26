library(SimRepeat)


### Name: checkpar
### Title: Parameter Check for Simulation Functions
### Aliases: checkpar
### Keywords: ParameterCheck

### ** Examples

# Example: system of three equations for 2 independent variables, where each
# error term has unit variance, from Headrick & Beasley (2002)
# Y_1 = beta_10 + beta_11 * X_11 + beta_12 * X_12 + sigma_1 * e_1
# Y_2 = beta_20 + beta_21 * X_21 + beta_22 * X_22 + sigma_2 * e_2
# Y_3 = beta_30 + beta_31 * X_31 + beta_32 * X_32 + sigma_3 * e_3
# X_11 = X_21 = X_31 = Exponential(2)
# X_12 = X_22 = X_32 = Laplace(0, 1)
# e_1 = e_2 = e_3 = Cauchy(0, 1)
M <- 3
Stcum1 <- calc_theory("Exponential", 2)
Stcum2 <- calc_theory("Laplace", c(0, 1))
Stcum3 <- c(0, 1, 0, 25, 0, 1500) # taken from paper
means <- lapply(seq_len(M), function(x) c(0, 0, 0))
vars <- lapply(seq_len(M), function(x) c(1, 1, 1))
skews <- lapply(seq_len(M), function(x) c(Stcum1[3], Stcum2[3], Stcum3[3]))
skurts <- lapply(seq_len(M), function(x) c(Stcum1[4], Stcum2[4], Stcum3[4]))
fifths <- lapply(seq_len(M), function(x) c(Stcum1[5], Stcum2[5], Stcum3[5]))
sixths <- lapply(seq_len(M), function(x) c(Stcum1[6], Stcum2[6], Stcum3[6]))
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
corr.e <- matrix(0.4, nrow = 3, ncol = 3)
diag(corr.e) <- 1
checkpar(M, "Polynomial", "non_mix", means, vars, skews,
  skurts, fifths, sixths, corr.x = corr.x, corr.yx = corr.yx,
  corr.e = corr.e, quiet = TRUE)




