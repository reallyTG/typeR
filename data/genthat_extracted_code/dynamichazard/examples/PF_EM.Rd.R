library(dynamichazard)


### Name: PF_EM
### Title: EM Estimation with Particle Filters and Smoothers
### Aliases: PF_EM

### ** Examples

## Not run: 
##D #####
##D # Fit model with lung data set from survival
##D # Warning: long-ish computation time
##D 
##D library(dynamichazard)
##D .lung <- lung[!is.na(lung$ph.ecog), ]
##D # standardize
##D .lung$age <- scale(.lung$age)
##D 
##D # fit
##D set.seed(43588155)
##D pf_fit <- PF_EM(
##D  Surv(time, status == 2) ~ ddFixed(ph.ecog) + age,
##D  data = .lung, by = 50, id = 1:nrow(.lung),
##D  Q_0 = diag(1, 2), Q = diag(.5^2, 2),
##D  max_T = 800,
##D  control = PF_control(
##D     N_fw_n_bw = 500, N_first = 2500, N_smooth = 5000,
##D     n_max = 50, eps = .001, Q_tilde = diag(.2^2, 2), est_a_0 = FALSE,
##D     n_threads = max(parallel::detectCores(logical = FALSE), 1)))
##D 
##D # Plot state vector estimates
##D plot(pf_fit, cov_index = 1)
##D plot(pf_fit, cov_index = 2)
##D 
##D # Plot log-likelihood
##D plot(pf_fit$log_likes)
## End(Not run)
## Not run: 
##D ######
##D # example with fixed intercept
##D 
##D # prepare data
##D temp <- subset(pbc, id <= 312, select=c(id, sex, time, status, edema, age))
##D pbc2 <- tmerge(temp, temp, id=id, death = event(time, status))
##D pbc2 <- tmerge(pbc2, pbcseq, id=id, albumin = tdc(day, albumin),
##D               protime = tdc(day, protime), bili = tdc(day, bili))
##D pbc2 <- pbc2[, c("id", "tstart", "tstop", "death", "sex", "edema",
##D                 "age", "albumin", "protime", "bili")]
##D pbc2 <- within(pbc2, {
##D  log_albumin <- log(albumin)
##D  log_protime <- log(protime)
##D  log_bili <- log(bili)
##D })
##D 
##D # standardize
##D for(c. in c("age", "log_albumin", "log_protime", "log_bili"))
##D  pbc2[[c.]] <- drop(scale(pbc2[[c.]]))
##D 
##D # fit model with extended Kalman filter
##D ddfit <- ddhazard(
##D  Surv(tstart, tstop, death == 2) ~ ddFixed_intercept() + ddFixed(age) +
##D    ddFixed(edema) + ddFixed(log_albumin) + ddFixed(log_protime) + log_bili,
##D  pbc2, Q_0 = 100, Q = 1e-2, by = 100, id = pbc2$id,
##D  model = "exponential", max_T = 3600,
##D  control = ddhazard_control(eps = 1e-5, NR_eps = 1e-4, n_max = 1e4))
##D summary(ddfit)
##D 
##D # fit model with particle filter
##D set.seed(88235076)
##D pf_fit <- PF_EM(
##D   Surv(tstart, tstop, death == 2) ~ ddFixed_intercept() + ddFixed(age) +
##D     ddFixed(edema) + ddFixed(log_albumin) + ddFixed(log_protime) + log_bili,
##D   pbc2, Q_0 = 2^2, Q = ddfit$Q * 100, # use estimate from before
##D   by = 100, id = pbc2$id,
##D   model = "exponential", max_T = 3600,
##D   control = PF_control(
##D     N_fw_n_bw = 500, N_smooth = 2500, N_first = 1000, eps = 1e-3,
##D     method = "AUX_normal_approx_w_cloud_mean", est_a_0 = FALSE,
##D     Q_tilde = as.matrix(.1^2),
##D     n_max = 25, # just take a few iterations as an example
##D     n_threads = max(parallel::detectCores(logical = FALSE), 1)))
##D 
##D # compare results
##D plot(ddfit)
##D plot(pf_fit)
##D sqrt(ddfit$Q * 100)
##D sqrt(pf_fit$Q)
##D rbind(ddfit$fixed_effects, pf_fit$fixed_effects)
## End(Not run)
## Not run: 
##D #####
##D # simulation example with `random` and `fixed` argument and a restricted
##D # model
##D 
##D # g groups with k individuals in each
##D g <- 3L
##D k <- 400L
##D 
##D # matrices for state equation
##D p <- g + 1L
##D G <- matrix(0., p^2, 2L)
##D for(i in 1:p)
##D   G[i + (i - 1L) * p, 1L + (i == p)] <- 1L
##D 
##D theta <- c(.9, .8)
##D # coefficients in transition density
##D (F. <- matrix(as.vector(G %*% theta), 4L, 4L))
##D 
##D J <- matrix(0., ncol = 2L, nrow = p)
##D J[-p, 1L] <- J[p, 2L] <- 1
##D psi <- c(log(c(.3, .1)))
##D 
##D K <- matrix(0., p * (p - 1L) / 2L, 2L)
##D j <- 0L
##D for(i in (p - 1L):1L){
##D   j <- j + i
##D   K[j, 2L] <- 1
##D }
##D K[K[, 2L] < 1, 1L] <- 1
##D phi <- log(-(c(.8, .3) + 1) / (c(.8, .3) - 1))
##D 
##D V <- diag(exp(drop(J %*% psi)))
##D C <- diag(1, ncol(V))
##D C[lower.tri(C)] <- 2/(1 + exp(-drop(K %*% phi))) - 1
##D C[upper.tri(C)] <- t(C)[upper.tri(C)]
##D (Q <- V %*% C %*% V)     # covariance matrix in transition density
##D cov2cor(Q)
##D 
##D Q_0 <- get_Q_0(Q, F.)    # time-invariant covariance matrix
##D beta <- c(rep(-6, g), 0) # all groups have the same long run mean intercept
##D 
##D # simulate state variables
##D set.seed(56219373)
##D n_periods <- 300L
##D alphas <- matrix(nrow = n_periods + 1L, ncol = p)
##D alphas[1L, ] <- rnorm(p) %*% chol(Q_0)
##D for(i in 1:n_periods + 1L)
##D   alphas[i, ] <- F. %*% alphas[i - 1L, ] + drop(rnorm(p) %*% chol(Q))
##D 
##D alphas <- t(t(alphas) + beta)
##D 
##D # plot state variables
##D matplot(alphas, type = "l", lty = 1)
##D 
##D # simulate individuals' outcome
##D n_obs <- g * k
##D df <- lapply(1:n_obs, function(i){
##D   # find the group
##D   grp <- (i - 1L) %/% (n_obs / g) + 1L
##D 
##D   # left-censoring
##D   tstart <- max(0L, sample.int((n_periods - 1L) * 2L, 1) - n_periods + 1L)
##D 
##D   # covariates
##D   x <- c(1, rnorm(1))
##D 
##D   # outcome (stop time and event indicator)
##D   osa <- NULL
##D   oso <- NULL
##D   osx <- NULL
##D   y <- FALSE
##D   for(tstop in (tstart + 1L):n_periods){
##D     sigmoid <- 1 / (1 + exp(- drop(x %*% alphas[tstop + 1L, c(grp, p)])))
##D     if(sigmoid > runif(1)){
##D       y <- TRUE
##D       break
##D     }
##D     if(.01 > runif(1L) && tstop < n_periods){
##D       # sample new covariate
##D       osa <- c(osa, tstart)
##D       tstart <- tstop
##D       oso <- c(oso, tstop)
##D       osx <- c(osx, x[2])
##D       x[2] <- rnorm(1)
##D     }
##D   }
##D 
##D   cbind(
##D     tstart = c(osa, tstart), tstop = c(oso, tstop),
##D     x = c(osx, x[2]), y = c(rep(FALSE, length(osa)), y), grp = grp,
##D     id = i)
##D })
##D df <- data.frame(do.call(rbind, df))
##D df$grp <- factor(df$grp)
##D 
##D # fit model. Start with "cheap" iterations
##D fit <- PF_EM(
##D   fixed = Surv(tstart, tstop, y) ~ x, random = ~ grp + x - 1,
##D   data = df, model = "logit", by = 1L, max_T = max(df$tstop),
##D   Q_0 = diag(1.5^2, p), id = df$id, type = "VAR",
##D   G = G, theta = c(.5, .5), J = J, psi = log(c(.1, .1)),
##D   K = K, phi = log(-(c(.4, 0) + 1) / (c(.4, 0) - 1)),
##D   control = PF_control(
##D     N_fw_n_bw = 100L, N_smooth = 100L, N_first = 500L,
##D     method = "AUX_normal_approx_w_cloud_mean",
##D     nu = 5L, # sample from multivariate t-distribution
##D     n_max = 50L,  # should maybe be larger
##D     smoother = "Fearnhead_O_N", eps = 1e-4,
##D     n_threads = 4L # depends on your cpu(s)
##D   ),
##D   trace = 1L)
##D plot(fit$log_likes) # log-likelihood approximation at each iterations
##D 
##D # take more iterations with more particles
##D cl <- fit$call
##D ctrl <- cl[["control"]]
##D ctrl[c("N_fw_n_bw", "N_smooth", "N_smooth_final", "N_first", "n_max")] <- list(
##D   500L, 2000L, 500L, 5000L, 30L)
##D cl[["control"]] <- ctrl
##D cl[c("phi", "psi", "theta")] <- list(fit$phi, fit$psi, fit$theta)
##D fit_extra <- eval(cl)
##D 
##D plot(fit_extra$log_likes) # log-likelihood approximation at each iteration
##D 
##D # check estimates
##D sqrt(diag(fit_extra$Q))
##D sqrt(diag(Q))
##D cov2cor(fit_extra$Q)
##D cov2cor(Q)
##D fit_extra$F
##D F.
##D 
##D # plot predicted state variables
##D for(i in 1:p){
##D   plot(fit_extra, cov_index = i)
##D   abline(h = 0, lty = 2)
##D   lines(1:nrow(alphas) - 1, alphas[, i] - beta[i], lty = 3)
##D }
## End(Not run)



