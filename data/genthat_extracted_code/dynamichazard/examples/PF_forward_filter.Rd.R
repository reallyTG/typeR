library(dynamichazard)


### Name: PF_forward_filter
### Title: Forward Particle Filter
### Aliases: PF_forward_filter PF_forward_filter.PF_EM
###   PF_forward_filter.formula PF_forward_filter.data.frame

### ** Examples

## Not run: 
##D # head-and-neck cancer study data. See Efron, B. (1988) doi:10.2307/2288857
##D is_censored <- c(
##D   6, 27, 34, 36, 42, 46, 48:51, 51 + c(15, 30:28, 33, 35:37, 39, 40, 42:45))
##D head_neck_cancer <- data.frame(
##D   id = 1:96,
##D   stop = c(
##D     1, 2, 2, rep(3, 6), 4, 4, rep(5, 8),
##D     rep(6, 7), 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 14, 14, 14, 15, 18, 18, 20,
##D     20, 37, 37, 38, 41, 45, 47, 47,
##D     2, 2, 3, rep(4, 4), rep(5, 5), rep(6, 5),
##D     7, 7, 7, 9, 10, 11, 12, 15, 16, 18, 18, 18, 21,
##D     21, 24, 25, 27, 36, 41, 44, 52, 54, 59, 59, 63, 67, 71, 76),
##D   event = !(1:96 %in% is_censored),
##D   group = factor(c(rep(1, 45 + 6), rep(2, 45))))
##D 
##D # fit model
##D set.seed(61364778)
##D ctrl <- PF_control(
##D   N_fw_n_bw = 500, N_smooth = 2500, N_first = 2000,
##D   n_max = 1, # set to one as an example
##D   n_threads = max(parallel::detectCores(logical = FALSE), 1),
##D   eps = .001, Q_tilde = as.matrix(.3^2), est_a_0 = FALSE)
##D pf_fit <- suppressWarnings(
##D   PF_EM(
##D     survival::Surv(stop, event) ~ ddFixed(group),
##D     data = head_neck_cancer, by = 1, Q_0 = 1, Q = 0.1^2, control = ctrl,
##D     max_T = 30))
##D 
##D # the log-likelihood in the final iteration
##D (end_log_like <- logLik(pf_fit))
##D 
##D # gives the same
##D fw_ps <- PF_forward_filter(
##D   survival::Surv(stop, event) ~ ddFixed(group), N_fw = 500, N_first = 2000,
##D   data = head_neck_cancer, by = 1, Q_0 = 1, Q = 0.1^2,
##D   a_0 = pf_fit$a_0, fixed_effects = -0.5370051,
##D   control = ctrl, max_T = 30, seed = pf_fit$seed)
##D all.equal(c(end_log_like), c(logLik(fw_ps)))
##D 
##D # will differ since we use different number of particles
##D fw_ps <- PF_forward_filter(
##D   survival::Surv(stop, event) ~ ddFixed(group), N_fw = 1000, N_first = 3000,
##D   data = head_neck_cancer, by = 1, Q_0 = 1, Q = 0.1^2,
##D   a_0 = pf_fit$a_0, fixed_effects = -0.5370051,
##D   control = ctrl, max_T = 30, seed = pf_fit$seed)
##D all.equal(c(end_log_like), c(logLik(fw_ps)))
##D 
##D # will differ since we use the final estimates
##D fw_ps <- PF_forward_filter(pf_fit, N_fw = 500, N_first = 2000)
##D all.equal(c(end_log_like), c(logLik(fw_ps)))
## End(Not run)



