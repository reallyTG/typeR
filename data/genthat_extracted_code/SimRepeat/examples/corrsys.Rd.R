library(SimRepeat)


### Name: corrsys
### Title: Generate Correlated Systems of Equations with Ordinal,
###   Continuous, and/or Count Variables: Correlation Method 1
### Aliases: corrsys
### Keywords: Fleishman Headrick NegativeBinomial Poisson continuous
###   method1 mixture ordinal simulation

### ** Examples

M <- 3
B <- calc_theory("Beta", c(4, 1.5))
skews <- lapply(seq_len(M), function(x) B[3])
skurts <- lapply(seq_len(M), function(x) B[4])
fifths <- lapply(seq_len(M), function(x) B[5])
sixths <- lapply(seq_len(M), function(x) B[6])
Six <- lapply(seq_len(M), function(x) list(0.03))
corr.e <- matrix(c(1, 0.4, 0.4^2, 0.4, 1, 0.4, 0.4^2, 0.4, 1), M, M,
  byrow = TRUE)
means <- lapply(seq_len(M), function(x) B[1])
vars <- lapply(seq_len(M), function(x) B[2]^2)
marginal <- list(0.3, 0.4, 0.5)
support <- lapply(seq_len(M), function(x) list(0:1))
corr.x <- list(list(matrix(1, 1, 1), matrix(0.4, 1, 1), matrix(0.4, 1, 1)),
  list(matrix(0.4, 1, 1), matrix(1, 1, 1), matrix(0.4, 1, 1)),
  list(matrix(0.4, 1, 1), matrix(0.4, 1, 1), matrix(1, 1, 1)))
betas <- list(0.5)
betas.t <- 1
betas.tint <- list(0.25)
Sys1 <- corrsys(10000, M, Time = 1:M, "Polynomial", "non_mix", means, vars,
  skews, skurts, fifths, sixths, Six, marginal = marginal, support = support,
  corr.x = corr.x, corr.e = corr.e, betas = betas, betas.t = betas.t,
  betas.tint = betas.tint, quiet = TRUE)

## Not run: 
##D seed <- 276
##D n <- 10000
##D M <- 3
##D Time <- 1:M
##D 
##D # Error terms have a beta(4, 1.5) distribution with an AR(1, p = 0.4)
##D # correlation structure
##D B <- calc_theory("Beta", c(4, 1.5))
##D skews <- lapply(seq_len(M), function(x) B[3])
##D skurts <- lapply(seq_len(M), function(x) B[4])
##D fifths <- lapply(seq_len(M), function(x) B[5])
##D sixths <- lapply(seq_len(M), function(x) B[6])
##D Six <- lapply(seq_len(M), function(x) list(0.03))
##D error_type <- "non_mix"
##D corr.e <- matrix(c(1, 0.4, 0.4^2, 0.4, 1, 0.4, 0.4^2, 0.4, 1), M, M,
##D   byrow = TRUE)
##D 
##D # 1 continuous mixture of Normal(-2, 1) and Normal(2, 1) for each Y
##D mix_pis <- lapply(seq_len(M), function(x) list(c(0.4, 0.6)))
##D mix_mus <- lapply(seq_len(M), function(x) list(c(-2, 2)))
##D mix_sigmas <- lapply(seq_len(M), function(x) list(c(1, 1)))
##D mix_skews <- lapply(seq_len(M), function(x) list(c(0, 0)))
##D mix_skurts <- lapply(seq_len(M), function(x) list(c(0, 0)))
##D mix_fifths <- lapply(seq_len(M), function(x) list(c(0, 0)))
##D mix_sixths <- lapply(seq_len(M), function(x) list(c(0, 0)))
##D mix_Six <- list()
##D Nstcum <- calc_mixmoments(mix_pis[[1]][[1]], mix_mus[[1]][[1]],
##D   mix_sigmas[[1]][[1]], mix_skews[[1]][[1]], mix_skurts[[1]][[1]],
##D   mix_fifths[[1]][[1]], mix_sixths[[1]][[1]])
##D 
##D means <- lapply(seq_len(M), function(x) c(Nstcum[1], B[1]))
##D vars <- lapply(seq_len(M), function(x) c(Nstcum[2]^2, B[2]^2))
##D 
##D # 1 binary variable for each Y
##D marginal <- lapply(seq_len(M), function(x) list(0.4))
##D support <- list(NULL, list(c(0, 1)), NULL)
##D 
##D # 1 Poisson variable for each Y
##D lam <- list(1, 5, 10)
##D # Y2 and Y3 are zero-inflated Poisson variables
##D p_zip <- list(NULL, 0.05, 0.1)
##D 
##D # 1 NB variable for each Y
##D size <- list(10, 15, 20)
##D prob <- list(0.3, 0.4, 0.5)
##D # either prob or mu is required (not both)
##D mu <- mapply(function(x, y) x * (1 - y)/y, size, prob, SIMPLIFY = FALSE)
##D # Y2 and Y3 are zero-inflated NB variables
##D p_zinb <- list(NULL, 0.05, 0.1)
##D 
##D # The 2nd (the normal mixture) variable is the same across Y
##D same.var <- 2
##D 
##D # Create the correlation matrix in terms of the components of the normal
##D # mixture
##D K <- 5
##D corr.x <- list()
##D corr.x[[1]] <- list(matrix(0.1, K, K), matrix(0.2, K, K), matrix(0.3, K, K))
##D diag(corr.x[[1]][[1]]) <- 1
##D # set correlation between components to 0
##D corr.x[[1]][[1]][2:3, 2:3] <- diag(2)
##D # set correlations with the same variable equal across outcomes
##D corr.x[[1]][[2]][, same.var] <- corr.x[[1]][[3]][, same.var] <-
##D   corr.x[[1]][[1]][, same.var]
##D corr.x[[2]] <- list(t(corr.x[[1]][[2]]), matrix(0.35, K, K),
##D   matrix(0.4, K, K))
##D   diag(corr.x[[2]][[2]]) <- 1
##D   corr.x[[2]][[2]][2:3, 2:3] <- diag(2)
##D corr.x[[2]][[2]][, same.var] <- corr.x[[2]][[3]][, same.var] <-
##D   t(corr.x[[1]][[2]][same.var, ])
##D corr.x[[2]][[3]][same.var, ] <- corr.x[[1]][[3]][same.var, ]
##D corr.x[[2]][[2]][same.var, ] <- t(corr.x[[2]][[2]][, same.var])
##D corr.x[[3]] <- list(t(corr.x[[1]][[3]]), t(corr.x[[2]][[3]]),
##D   matrix(0.5, K, K))
##D diag(corr.x[[3]][[3]]) <- 1
##D corr.x[[3]][[3]][2:3, 2:3] <- diag(2)
##D corr.x[[3]][[3]][, same.var] <- t(corr.x[[1]][[3]][same.var, ])
##D corr.x[[3]][[3]][same.var, ] <- t(corr.x[[3]][[3]][, same.var])
##D 
##D # The 2nd and 3rd variables of each Y are subject-level variables
##D subj.var <- matrix(c(1, 2, 1, 3, 2, 2, 2, 3, 3, 2, 3, 3), 6, 2, byrow = TRUE)
##D int.var <- tint.var <- NULL
##D betas.0 <- 0
##D betas <- list(seq(0.5, 0.5 + (K - 2) * 0.25, 0.25))
##D betas.subj <- list(seq(0.5, 0.5 + (K - 2) * 0.1, 0.1))
##D betas.int <- list()
##D betas.t <- 1
##D betas.tint <- list(c(0.25, 0.5))
##D 
##D method <- "Polynomial"
##D 
##D # Check parameter inputs
##D checkpar(M, method, error_type, means, vars, skews, skurts, fifths, sixths,
##D   Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts, mix_fifths,
##D   mix_sixths, mix_Six, marginal, support, lam, p_zip, pois_eps = list(),
##D   size, prob, mu, p_zinb, nb_eps = list(), corr.x, corr.yx = list(),
##D   corr.e, same.var, subj.var, int.var, tint.var, betas.0, betas,
##D   betas.subj, betas.int, betas.t, betas.tint)
##D 
##D # Simulated system using correlation method 1
##D N <- corrsys(n, M, Time, method, error_type, means, vars, skews, skurts,
##D   fifths, sixths, Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts,
##D   mix_fifths, mix_sixths, mix_Six, marginal, support, lam, p_zip, size,
##D   prob, mu, p_zinb, corr.x, corr.e, same.var, subj.var, int.var, tint.var,
##D   betas.0, betas, betas.subj, betas.int, betas.t, betas.tint, seed = seed,
##D   use.nearPD = FALSE)
##D 
##D # Summarize the results
##D S <- summary_sys(N$Y, N$E, E_mix = NULL, N$X, N$X_all, M, method, means,
##D   vars, skews, skurts, fifths, sixths, mix_pis, mix_mus, mix_sigmas,
##D   mix_skews, mix_skurts, mix_fifths, mix_sixths, marginal, support, lam,
##D   p_zip, size, prob, mu, p_zinb, corr.x, corr.e)
## End(Not run)




