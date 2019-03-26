library(SimRepeat)


### Name: nonnormsys
### Title: Generate Correlated Systems of Equations Containing Normal,
###   Non-Normal, and Mixture Continuous Variables
### Aliases: nonnormsys
### Keywords: Beasley Headrick continuous mixture

### ** Examples

M <- 3
B <- calc_theory("Beta", c(4, 1.5))
skews <- lapply(seq_len(M), function(x) c(0, B[3]))
skurts <- lapply(seq_len(M), function(x) c(0, B[4]))
fifths <- lapply(seq_len(M), function(x) c(0, B[5]))
sixths <- lapply(seq_len(M), function(x) c(0, B[6]))
Six <- lapply(seq_len(M), function(x) list(NULL, 0.03))
corr.e <- matrix(c(1, 0.4, 0.4^2, 0.4, 1, 0.4, 0.4^2, 0.4, 1), M, M,
  byrow = TRUE)
means <- lapply(seq_len(M), function(x) c(0, B[1]))
vars <- lapply(seq_len(M), function(x) c(1, B[2]^2))
corr.x <- list(list(matrix(1, 1, 1), matrix(0.4, 1, 1), matrix(0.4, 1, 1)),
  list(matrix(0.4, 1, 1), matrix(1, 1, 1), matrix(0.4, 1, 1)),
  list(matrix(0.4, 1, 1), matrix(0.4, 1, 1), matrix(1, 1, 1)))
corr.yx <- list(matrix(0.4, 1), matrix(0.5, 1), matrix(0.6, 1))
Sys1 <- nonnormsys(10000, M, "Polynomial", "non_mix", means, vars,
  skews, skurts, fifths, sixths, Six, corr.x = corr.x, corr.yx = corr.yx,
  corr.e = corr.e)

## Not run: 
##D # Example: system of three equations for 2 independent variables, where each
##D # error term has unit variance, from Headrick & Beasley (2002)
##D # Y_1 = beta_10 + beta_11 * X_11 + beta_12 * X_12 + sigma_1 * e_1
##D # Y_2 = beta_20 + beta_21 * X_21 + beta_22 * X_22 + sigma_2 * e_2
##D # Y_3 = beta_30 + beta_31 * X_31 + beta_32 * X_32 + sigma_3 * e_3
##D 
##D # X_11 = X_21 = X_31 = Exponential(2)
##D # X_12 = X_22 = X_32 = Laplace(0, 1)
##D # e_1 = e_2 = e_3 = Cauchy(0, 1)
##D 
##D seed <- 1234
##D M <- 3
##D Stcum1 <- calc_theory("Exponential", 2)
##D Stcum2 <- calc_theory("Laplace", c(0, 1))
##D Stcum3 <- c(0, 1, 0, 25, 0, 1500) # taken from paper
##D means <- lapply(seq_len(M), function(x) c(0, 0, 0))
##D vars <- lapply(seq_len(M), function(x) c(1, 1, 1))
##D skews <- lapply(seq_len(M), function(x) c(Stcum1[3], Stcum2[3], Stcum3[3]))
##D skurts <- lapply(seq_len(M), function(x) c(Stcum1[4], Stcum2[4], Stcum3[4]))
##D fifths <- lapply(seq_len(M), function(x) c(Stcum1[5], Stcum2[5], Stcum3[5]))
##D sixths <- lapply(seq_len(M), function(x) c(Stcum1[6], Stcum2[6], Stcum3[6]))
##D 
##D # No sixth cumulant corrections will be used in order to match the results
##D # from the paper.
##D 
##D corr.yx <- list(matrix(c(0.4, 0.4), 1), matrix(c(0.5, 0.5), 1),
##D   matrix(c(0.6, 0.6), 1))
##D corr.x <- list()
##D corr.x[[1]] <- corr.x[[2]] <- corr.x[[3]] <- list()
##D corr.x[[1]][[1]] <- matrix(c(1, 0.1, 0.1, 1), 2, 2)
##D corr.x[[1]][[2]] <- matrix(c(0.1974318, 0.1859656, 0.1879483, 0.1858601),
##D   2, 2, byrow = TRUE)
##D corr.x[[1]][[3]] <- matrix(c(0.2873190, 0.2589830, 0.2682057, 0.2589542),
##D   2, 2, byrow = TRUE)
##D corr.x[[2]][[1]] <- t(corr.x[[1]][[2]])
##D corr.x[[2]][[2]] <- matrix(c(1, 0.35, 0.35, 1), 2, 2)
##D corr.x[[2]][[3]] <- matrix(c(0.5723303, 0.4883054, 0.5004441, 0.4841808),
##D   2, 2, byrow = TRUE)
##D corr.x[[3]][[1]] <- t(corr.x[[1]][[3]])
##D corr.x[[3]][[2]] <- t(corr.x[[2]][[3]])
##D corr.x[[3]][[3]] <- matrix(c(1, 0.7, 0.7, 1), 2, 2)
##D corr.e <- matrix(0.4, nrow = 3, ncol = 3)
##D diag(corr.e) <- 1
##D 
##D # Check the parameter inputs
##D checkpar(M, "Polynomial", "non_mix", means, vars, skews,
##D   skurts, fifths, sixths, corr.x = corr.x, corr.yx = corr.yx,
##D   corr.e = corr.e)
##D # Generate the system
##D Sys1 <- nonnormsys(10000, M, "Polynomial", "non_mix", means, vars, skews,
##D   skurts, fifths, sixths, corr.x = corr.x, corr.yx = corr.yx,
##D   corr.e = corr.e, seed = seed)
##D # Summarize the results
##D Sum1 <- summary_sys(Sys1$Y, Sys1$E, E_mix = NULL, Sys1$X, X_all = list(), M,
##D   "Polynomial", means, vars, skews, skurts, fifths, sixths, corr.x = corr.x,
##D   corr.e = corr.e)
##D 
##D # Calculate theoretical correlations for comparison to simulated values
##D calc_corr_y(Sys1$betas, corr.x, corr.e, vars)
##D Sum1$rho.y
##D calc_corr_ye(Sys1$betas, corr.x, corr.e, vars)
##D Sum1$rho.ye
##D calc_corr_yx(Sys1$betas, corr.x, vars)
##D Sum1$rho.yx
## End(Not run)



