## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, message=FALSE, fig.align = 'center', fig.width = 6, fig.height = 4, cache = FALSE)

## ---- include=FALSE------------------------------------------------------
library("bookdown")

## ------------------------------------------------------------------------
library("SimRepeat")
library("printr")
options(scipen = 999)
seed <- 111
n <- 10000
M <- 3

method <- "Polynomial"
Stcum1 <- calc_theory("Exponential", 2)
Stcum2 <- calc_theory("Laplace", c(0, 1))
Stcum3 <- c(0, 1, 0, 25, 0, 1500)

means <- lapply(seq_len(M), function(x) rep(0, 3))
vars <- lapply(seq_len(M), function(x) rep(1, 3))

skews <- lapply(seq_len(M), function(x) c(Stcum1[3], Stcum2[3], Stcum3[3]))
skurts <- lapply(seq_len(M), function(x) c(Stcum1[4], Stcum2[4], Stcum3[4]))
fifths <- lapply(seq_len(M), function(x) c(Stcum1[5], Stcum2[5], Stcum3[5]))
sixths <- lapply(seq_len(M), function(x) c(Stcum1[6], Stcum2[6], Stcum3[6]))
Six <- list()

# Note the following would be used to obtain all valid PDF's
# Six <- lapply(seq_len(M), function(x) list(NULL, 25.14, NULL))

betas.0 <- 0
corr.x <- list()
corr.x[[1]] <- corr.x[[2]] <- corr.x[[3]] <- list()
corr.x[[1]][[1]] <- matrix(c(1, 0.1, 0.1, 1), nrow = 2, ncol = 2)
corr.x[[1]][[2]] <- matrix(c(0.1974318, 0.1859656, 0.1879483, 0.1858601),
                           2, 2, byrow = TRUE)
corr.x[[1]][[3]] <- matrix(c(0.2873190, 0.2589830, 0.2682057, 0.2589542),
                           2, 2, byrow = TRUE)
corr.x[[2]][[1]] <- t(corr.x[[1]][[2]])
corr.x[[2]][[2]] <- matrix(c(1, 0.35, 0.35, 1), nrow = 2, ncol = 2)
corr.x[[2]][[3]] <- matrix(c(0.5723303, 0.4883054, 0.5004441, 0.4841808),
                           2, 2, byrow = TRUE)
corr.x[[3]][[1]] <- t(corr.x[[1]][[3]])
corr.x[[3]][[2]] <- t(corr.x[[2]][[3]])
corr.x[[3]][[3]] <- matrix(c(1, 0.7, 0.7, 1), nrow = 2, ncol = 2)

corr.yx <- list(matrix(c(0.4, 0.4), 1), matrix(c(0.5, 0.5), 1), 
  matrix(c(0.6, 0.6), 1))
corr.e <- matrix(0.4, nrow = M, ncol = M)
diag(corr.e) <- 1
error_type <- "non_mix"

## ------------------------------------------------------------------------
checkpar(M, method, error_type, means, vars, skews, skurts, fifths, sixths, 
  Six, betas.0 = betas.0, corr.x = corr.x, corr.yx = corr.yx, corr.e = corr.e, 
  quiet = TRUE)

## ------------------------------------------------------------------------
Sys1 <- nonnormsys(n, M, method, error_type, means, vars, skews, skurts,
  fifths, sixths, Six, betas.0 = betas.0, corr.x = corr.x, corr.yx = corr.yx, 
  corr.e = corr.e, seed = seed, quiet = TRUE)

## ------------------------------------------------------------------------
knitr::kable(Sys1$betas, booktabs = TRUE, caption = "Beta coefficients")

## ------------------------------------------------------------------------
knitr::kable(Sys1$constants[[1]], booktabs = TRUE, caption = "PMT constants")
Sys1$valid.pdf

## ------------------------------------------------------------------------
Sum1 <- summary_sys(Sys1$Y, Sys1$E, E_mix = NULL, Sys1$X, Sys1$X_all, M,
  method, means, vars, skews, skurts, fifths, sixths, corr.x = corr.x,
  corr.e = corr.e)

## ------------------------------------------------------------------------
knitr::kable(Sum1$cont_sum_y, booktabs = TRUE, 
  caption = "Simulated Distributions of Outcomes")

## ------------------------------------------------------------------------
knitr::kable(Sum1$target_sum_x, booktabs = TRUE, 
  caption = "Target Distributions of Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum1$cont_sum_x, booktabs = TRUE, 
  caption = "Simulated Distributions of Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum1$target_sum_e, booktabs = TRUE, 
  caption = "Target Distributions of Error Terms")

## ------------------------------------------------------------------------
knitr::kable(Sum1$cont_sum_e, booktabs = TRUE, 
  caption = "Simulated Distributions of Error Terms")

## ------------------------------------------------------------------------
maxerr <- do.call(rbind, Sum1$maxerr)
rownames(maxerr) <- colnames(maxerr) <- paste("Y", 1:M, sep = "")
knitr::kable(as.data.frame(maxerr), digits = 5, booktabs = TRUE, 
  caption = "Maximum Correlation Errors for X Variables")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_y(Sys1$betas, corr.x, corr.e, vars), 
  booktabs = TRUE, caption = "Expected Y Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum1$rho.y, booktabs = TRUE, 
  caption = "Simulated Y Correlations")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_ye(Sys1$betas, corr.x, corr.e, vars), 
  booktabs = TRUE, caption = "Expected Y, E Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum1$rho.ye, 
  booktabs = TRUE, caption = "Simulated Y, E Correlations")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_yx(Sys1$betas, corr.x, vars), 
  booktabs = TRUE, caption = "Expected Y, X Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum1$rho.yx, 
  booktabs = TRUE, caption = "Simulated Y, X Correlations")

## ------------------------------------------------------------------------
seed <- 276
n <- 10000
M <- 3

method <- "Polynomial"
L <- calc_theory("Logistic", c(0, 1))
C <- calc_theory("Chisq", 4)
B <- calc_theory("Beta", c(4, 1.5))

skews <- lapply(seq_len(M), function(x) c(L[3], B[3]))
skurts <- lapply(seq_len(M), function(x) c(L[4], B[4]))
fifths <- lapply(seq_len(M), function(x) c(L[5], B[5]))
sixths <- lapply(seq_len(M), function(x) c(L[6], B[6]))
Six <- lapply(seq_len(M), function(x) list(1.75, 0.03))

mix_pis <- lapply(seq_len(M), function(x) list(c(0.4, 0.6), c(0.3, 0.2, 0.5)))
mix_mus <- lapply(seq_len(M), function(x) list(c(-2, 2), c(L[1], C[1], B[1])))
mix_sigmas <- lapply(seq_len(M),
  function(x) list(c(1, 1), c(L[2], C[2], B[2])))
mix_skews <- lapply(seq_len(M),
  function(x) list(c(0, 0), c(L[3], C[3], B[3])))
mix_skurts <- lapply(seq_len(M),
  function(x) list(c(0, 0), c(L[4], C[4], B[4])))
mix_fifths <- lapply(seq_len(M),
  function(x) list(c(0, 0), c(L[5], C[5], B[5])))
mix_sixths <- lapply(seq_len(M),
  function(x) list(c(0, 0), c(L[6], C[6], B[6])))
mix_Six <- lapply(seq_len(M), function(x) list(NULL, NULL, 1.75, NULL, 0.03))
Nstcum <- calc_mixmoments(mix_pis[[1]][[1]], mix_mus[[1]][[1]],
  mix_sigmas[[1]][[1]], mix_skews[[1]][[1]], mix_skurts[[1]][[1]],
  mix_fifths[[1]][[1]], mix_sixths[[1]][[1]])
Mstcum <- calc_mixmoments(mix_pis[[2]][[2]], mix_mus[[2]][[2]],
  mix_sigmas[[2]][[2]], mix_skews[[2]][[2]], mix_skurts[[2]][[2]],
  mix_fifths[[2]][[2]], mix_sixths[[2]][[2]])
means <- lapply(seq_len(M),
  function(x) c(L[1], B[1], Nstcum[1], Mstcum[1]))
vars <- lapply(seq_len(M),
  function(x) c(L[2]^2, B[2]^2, Nstcum[2]^2, Mstcum[2]^2))

same.var <- 1
betas.0 <- 0

corr.x <- list()
corr.x[[1]] <- list(matrix(0.1, 4, 4), matrix(0.2, 4, 4), matrix(0.3, 4, 4))
diag(corr.x[[1]][[1]]) <- 1

# set correlations between components of the same mixture variable to 0
corr.x[[1]][[1]][3:4, 3:4] <- diag(2)

# since X1 is the same across outcomes, set correlation the same
corr.x[[1]][[2]][, same.var] <- corr.x[[1]][[3]][, same.var] <-
  corr.x[[1]][[1]][, same.var]

corr.x[[2]] <- list(t(corr.x[[1]][[2]]), matrix(0.35, 4, 4), matrix(0.4, 4, 4))
diag(corr.x[[2]][[2]]) <- 1

# set correlations between components of the same mixture variable to 0
corr.x[[2]][[2]][3:4, 3:4] <- diag(2)

# since X1 is the same across outcomes, set correlation the same
corr.x[[2]][[2]][, same.var] <- corr.x[[2]][[3]][, same.var] <-
  t(corr.x[[1]][[2]][same.var, ])
corr.x[[2]][[3]][same.var, ] <- corr.x[[1]][[3]][same.var, ]
corr.x[[2]][[2]][same.var, ] <- t(corr.x[[2]][[2]][, same.var])

corr.x[[3]] <- list(t(corr.x[[1]][[3]]), t(corr.x[[2]][[3]]), 
  matrix(0.5, 4, 4))
diag(corr.x[[3]][[3]]) <- 1

# set correlations between components of the same mixture variable to 0
corr.x[[3]][[3]][3:4, 3:4] <- diag(2)

# since X1 is the same across outcomes, set correlation the same
corr.x[[3]][[3]][, same.var] <- t(corr.x[[1]][[3]][same.var, ])
corr.x[[3]][[3]][same.var, ] <- t(corr.x[[3]][[3]][, same.var])

corr.yx <- list(matrix(0.3, 1, 4), matrix(0.4, 1, 4), matrix(0.5, 1, 4))

corr.e <- matrix(0.4, 9, 9)
corr.e[1:3, 1:3] <- corr.e[4:6, 4:6] <- corr.e[7:9, 7:9] <- diag(3)
error_type = "mix"

## ------------------------------------------------------------------------
checkpar(M, method, error_type, means, vars, skews, skurts, fifths, sixths, 
  Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts, mix_fifths, 
  mix_sixths, mix_Six, same.var = same.var, betas.0 = betas.0, corr.x = corr.x, 
  corr.yx = corr.yx, corr.e = corr.e, quiet = TRUE)

## ------------------------------------------------------------------------
Sys2 <- nonnormsys(n, M, method, error_type, means, vars, skews, skurts,
  fifths, sixths, Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts,
  mix_fifths, mix_sixths, mix_Six, same.var, betas.0, corr.x, corr.yx, corr.e,
  seed, use.nearPD = FALSE, quiet = TRUE)

## ------------------------------------------------------------------------
knitr::kable(Sys2$betas, booktabs = TRUE, caption = "Beta coefficients")

## ------------------------------------------------------------------------
knitr::kable(Sys2$constants[[1]], booktabs = TRUE, caption = "PMT constants")
Sys2$valid.pdf

## ------------------------------------------------------------------------
Sum2 <- summary_sys(Sys2$Y, Sys2$E, Sys2$E_mix, Sys2$X, Sys2$X_all, M, method, 
  means, vars, skews, skurts, fifths, sixths, mix_pis, mix_mus, mix_sigmas,
  mix_skews, mix_skurts, mix_fifths, mix_sixths, corr.x = corr.x,
  corr.e = corr.e)

## ------------------------------------------------------------------------
knitr::kable(Sum2$cont_sum_y, booktabs = TRUE, 
  caption = "Simulated Distributions of Outcomes")

## ------------------------------------------------------------------------
knitr::kable(Sum2$target_sum_x, booktabs = TRUE, 
  caption = "Target Distributions of Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum2$cont_sum_x, booktabs = TRUE, 
  caption = "Simulated Distributions of Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum2$target_mix_x, booktabs = TRUE, 
  caption = "Target Distributions of Mixture Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum2$mix_sum_x, booktabs = TRUE, 
  caption = "Simulated Distributions of Mixture Independent Variables")

## ------------------------------------------------------------------------
Nplot <- plot_simpdf_theory(sim_y = Sys2$X_all[[1]][, 3], ylower = -10, 
  yupper = 10, 
  title = "PDF of X_11: Mixture of N(-2, 1) and N(2, 1) Distributions",
  fx = function(x) mix_pis[[1]][[1]][1] * dnorm(x, mix_mus[[1]][[1]][1], 
    mix_sigmas[[1]][[1]][1]) + mix_pis[[1]][[1]][2] * 
    dnorm(x, mix_mus[[1]][[1]][2], mix_sigmas[[1]][[1]][2]), 
  lower = -Inf, upper = Inf)
Nplot

## ------------------------------------------------------------------------
knitr::kable(Sum2$target_mix_e, booktabs = TRUE, 
  caption = "Target Distributions of Mixture Error Terms")

## ------------------------------------------------------------------------
knitr::kable(Sum2$mix_sum_e, booktabs = TRUE, 
  caption = "Simulated Distributions of Mixture Error Terms")

## ------------------------------------------------------------------------
Mplot <- plot_simpdf_theory(sim_y = Sys2$E_mix[, 1], 
  title = paste("PDF of E_1: Mixture of Logistic(0, 1), Chisq(4),", 
    "\nand Beta(4, 1.5) Distributions", sep = ""),
  fx = function(x) mix_pis[[1]][[2]][1] * dlogis(x, 0, 1) + 
    mix_pis[[1]][[2]][2] * dchisq(x, 4) + mix_pis[[1]][[2]][3] * 
    dbeta(x, 4, 1.5), 
  lower = -Inf, upper = Inf)
Mplot

## ------------------------------------------------------------------------
maxerr <- do.call(rbind, Sum2$maxerr)
rownames(maxerr) <- colnames(maxerr) <- paste("Y", 1:M, sep = "")
knitr::kable(as.data.frame(maxerr), digits = 5, booktabs = TRUE, 
  caption = "Maximum Correlation Errors for X Variables")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_y(Sys2$betas, corr.x, corr.e, vars, mix_pis, 
  mix_mus, mix_sigmas, "mix"), booktabs = TRUE, 
  caption = "Expected Y Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum2$rho.y, booktabs = TRUE, 
  caption = "Simulated Y Correlations")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_ye(Sys2$betas, corr.x, corr.e, vars, mix_pis, 
  mix_mus, mix_sigmas, "mix"), booktabs = TRUE, 
  caption = "Expected Y, E Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum2$rho.yemix, booktabs = TRUE, 
  caption = "Simulated Y, E Correlations")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_yx(Sys2$betas, corr.x, vars, mix_pis, 
  mix_mus, mix_sigmas, "mix"), booktabs = TRUE, 
  caption = "Expected Y, X Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum2$rho.yx, booktabs = TRUE, 
  caption = "Simulated Y, X Correlations")

## ------------------------------------------------------------------------
seed <- 276
n <- 10000
M <- 3

method <- "Polynomial"
L <- calc_theory("Logistic", c(0, 1))
C <- calc_theory("Chisq", 4)
B <- calc_theory("Beta", c(4, 1.5))

skews <- list(c(L[3], B[3]), NULL, c(L[3], B[3]))
skurts <- list(c(L[4], B[4]), NULL, c(L[4], B[4]))
fifths <- list(c(L[5], B[5]), NULL, c(L[5], B[5]))
sixths <- list(c(L[6], B[6]), NULL, c(L[6], B[6]))
Six <- list(list(1.75, 0.03), NULL, list(1.75, 0.03))

mix_pis <- list(list(c(0.4, 0.6), c(0.3, 0.2, 0.5)), list(c(0.3, 0.2, 0.5)), 
  list(c(0.4, 0.6), c(0.3, 0.2, 0.5)))
mix_mus <- list(list(c(-2, 2), c(L[1], C[1], B[1])), list(c(L[1], C[1], B[1])), 
  list(c(-2, 2), c(L[1], C[1], B[1])))
mix_sigmas <- list(list(c(1, 1), c(L[2], C[2], B[2])), 
  list(c(L[2], C[2], B[2])), list(c(1, 1), c(L[2], C[2], B[2])))
mix_skews <- list(list(c(0, 0), c(L[3], C[3], B[3])), 
  list(c(L[3], C[3], B[3])), list(c(0, 0), c(L[3], C[3], B[3])))
mix_skurts <- list(list(c(0, 0), c(L[4], C[4], B[4])), 
  list(c(L[4], C[4], B[4])),list(c(0, 0), c(L[4], C[4], B[4])))
mix_fifths <- list(list(c(0, 0), c(L[5], C[5], B[5])), 
  list(c(L[5], C[5], B[5])), list(c(0, 0), c(L[5], C[5], B[5])))
mix_sixths <- list(list(c(0, 0), c(L[6], C[6], B[6])), 
  list(c(L[6], C[6], B[6])), list(c(0, 0), c(L[6], C[6], B[6])))
mix_Six <- list(list(NULL, NULL, 1.75, NULL, 0.03), list(1.75, NULL, 0.03), 
  list(NULL, NULL, 1.75, NULL, 0.03))
means <- list(c(L[1], B[1], Nstcum[1], Mstcum[1]), Mstcum[1], 
  c(L[1], B[1], Nstcum[1], Mstcum[1]))
vars <- list(c(L[2]^2, B[2]^2, Nstcum[2]^2, Mstcum[2]^2), Mstcum[2]^2, 
  c(L[2]^2, B[2]^2, Nstcum[2]^2, Mstcum[2]^2))

# since Y_2 has no X variables, same.var must be changed to a matrix
same.var <- matrix(c(1, 1, 3, 1), 1, 4)

corr.x <- list(list(matrix(0.1, 4, 4), NULL, matrix(0.3, 4, 4)), NULL)
diag(corr.x[[1]][[1]]) <- 1

# set correlations between components of the same mixture variable to 0
corr.x[[1]][[1]][3:4, 3:4] <- diag(2)

# since X1 is the same across outcomes, set correlation the same
corr.x[[1]][[3]][, 1] <- corr.x[[1]][[1]][, 1]

corr.x <- append(corr.x, list(list(t(corr.x[[1]][[3]]), NULL, matrix(0.5, 4, 4))))
diag(corr.x[[3]][[3]]) <- 1

# set correlations between components of the same mixture variable to 0
corr.x[[3]][[3]][3:4, 3:4] <- diag(2)

# since X1 is the same across outcomes, set correlation the same
corr.x[[3]][[3]][, 1] <- t(corr.x[[1]][[3]][1, ])
corr.x[[3]][[3]][1, ] <- t(corr.x[[3]][[3]][, 1])

corr.yx <- list(matrix(0.3, 1, 4), NULL, matrix(0.5, 1, 4))

corr.e <- matrix(0.4, 9, 9)
corr.e[1:3, 1:3] <- corr.e[4:6, 4:6] <- corr.e[7:9, 7:9] <- diag(3)
error_type = "mix"

## ------------------------------------------------------------------------
checkpar(M, method, error_type, means, vars, skews, skurts, fifths, sixths, 
  Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts, mix_fifths, 
  mix_sixths, mix_Six, same.var = same.var, betas.0 = betas.0, corr.x = corr.x, 
  corr.yx = corr.yx, corr.e = corr.e, quiet = TRUE)

## ------------------------------------------------------------------------
Sys3 <- nonnormsys(n, M, method, error_type, means, vars, skews, skurts,
  fifths, sixths, Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts,
  mix_fifths, mix_sixths, mix_Six, same.var, betas.0, corr.x, corr.yx, corr.e,
  seed, use.nearPD = FALSE, quiet = TRUE)

## ------------------------------------------------------------------------
knitr::kable(Sys3$betas, booktabs = TRUE, caption = "Beta coefficients")

## ------------------------------------------------------------------------
knitr::kable(Sys3$constants[[1]], booktabs = TRUE, caption = "PMT constants")
Sys3$valid.pdf

## ------------------------------------------------------------------------
Sum3 <- summary_sys(Sys3$Y, Sys3$E, Sys3$E_mix, Sys3$X, Sys3$X_all, M, method, 
  means, vars, skews, skurts, fifths, sixths, mix_pis, mix_mus, mix_sigmas,
  mix_skews, mix_skurts, mix_fifths, mix_sixths, corr.x = corr.x,
  corr.e = corr.e)

## ------------------------------------------------------------------------
knitr::kable(Sum3$cont_sum_y, booktabs = TRUE, 
  caption = "Simulated Distributions of Outcomes")

## ------------------------------------------------------------------------
knitr::kable(Sum3$target_sum_x, booktabs = TRUE,
  caption = "Target Distributions of Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum3$cont_sum_x, booktabs = TRUE,
  caption = "Simulated Distributions of Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum3$target_mix_x, booktabs = TRUE,
  caption = "Target Distributions of Mixture Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum3$mix_sum_x, booktabs = TRUE,
  caption = "Simulated Distributions of Mixture Independent Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum3$target_mix_e, booktabs = TRUE,
  caption = "Target Distributions of Mixture Error Terms")

## ------------------------------------------------------------------------
knitr::kable(Sum3$mix_sum_e, booktabs = TRUE,
  caption = "Simulated Distributions of Mixture Error Terms")

## ------------------------------------------------------------------------
maxerr <- rbind(Sum3$maxerr[[1]][-2], Sum3$maxerr[[3]][-2])
rownames(maxerr) <- colnames(maxerr) <- c("Y1", "Y3")
knitr::kable(as.data.frame(maxerr), digits = 5, booktabs = TRUE,
  caption = "Maximum Correlation Errors for X Variables")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_y(Sys3$betas, corr.x, corr.e, vars, mix_pis, 
  mix_mus, mix_sigmas, "mix"), booktabs = TRUE,
  caption = "Expected Y Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum3$rho.y, booktabs = TRUE, 
  caption = "Simulated Y Correlations")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_ye(Sys3$betas, corr.x, corr.e, vars, mix_pis, 
  mix_mus, mix_sigmas, "mix"), booktabs = TRUE,
  caption = "Expected Y, E Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum3$rho.yemix, booktabs = TRUE,
  caption = "Simulated Y, E Correlations")

## ------------------------------------------------------------------------
knitr::kable(calc_corr_yx(Sys3$betas, corr.x, vars, mix_pis, 
  mix_mus, mix_sigmas, "mix"), booktabs = TRUE,
  caption = "Expected Y, X Correlations")

## ------------------------------------------------------------------------
knitr::kable(Sum3$rho.yx, booktabs = TRUE,
  caption = "Simulated Y, X Correlations")

