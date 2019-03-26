library(metafolio)


### Name: run_cons_plans
### Title: Run conservation plans and return the portfolio mean and
###   variance values
### Aliases: run_cons_plans

### ** Examples

## Not run: 
##D set.seed(1)
##D w_plans <- list()
##D w_plans[[1]] <- c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5)
##D w_plans[[2]] <- c(5, 5, 5, 1000, 1000, 1000, 1000, 5, 5, 5)
##D w_plans[[3]] <- c(rep(1000, 4), rep(5, 6))
##D w_plans[[4]] <- rev(w_plans[[3]])
##D plans_name_sp <- c("Full range of responses", "Most stable only",
##D "Lower half", "Upper half")
##D  n_trials <- 50 # number of trials at each n conservation plan
##D  n_plans <- 4 # number of plans
##D  num_pops <- c(2, 4, 8, 16) # n pops to conserve
##D  w <- list()
##D  for(i in 1:n_plans) { # loop over number conserved
##D   w[[i]] <- list()
##D   for(j in 1:n_trials) { # loop over trials
##D     w[[i]][[j]] <- matrix(rep(625, 16), nrow = 1)
##D     w[[i]][[j]][-sample(1:16, num_pops[i])] <- 5
##D   }
##D  }
##D arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
##D 
##D x_arma_sp <- run_cons_plans(w, env_type = "arma", env_params = arma_env_params)
##D 
##D plot_cons_plans(x_arma_sp$plans_mv, plans_name = plans_name_sp, cols =
##D   cols, add_all_efs = FALSE, xlim = c(0.02, 0.15), ylim = c(-0.017,
##D     0.017), add_legend = FALSE)
##D 
##D # In this version, the pops are wiped out; total abundance changes
##D n_trials <- 50 # number of trials at each n conservation plan
##D num_pops <- c(2, 4, 8, 16) # n pops to conserve
##D n_plans <- length(num_pops) # number of plans
##D w <- list()
##D for(i in 1:n_plans) { # loop over number conserved
##D  w[[i]] <- list()
##D  for(j in 1:n_trials) { # loop over trials
##D    w[[i]][[j]] <- matrix(rep(1000, 16), nrow = 1)
##D    w[[i]][[j]][-sample(1:16, num_pops[i])] <- 5
##D  }
##D }
##D plans_name_n <- paste(num_pops, "populations")
##D arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
##D 
##D x_arma_n <- run_cons_plans(w, env_type = "arma", env_params =
##D   arma_env_params, max_a = thermal_integration(16))
##D 
##D plot_cons_plans(x_arma_n$plans_mv, plans_name = plans_name_n, cols =
##D   cols, add_all_efs = FALSE, xlim = c(0.02, 0.15), ylim = c(-0.017,
##D     0.017), add_legend = FALSE)
## End(Not run)



