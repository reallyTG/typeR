library(metafolio)


### Name: count_quasi_exts
### Title: Take 'meta_sim' output objects and count quasi extinctions
### Aliases: count_quasi_exts

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
##D count_quasi_exts(x_arma_sp$plans_port, quasi_thresh = 200)
## End(Not run)



