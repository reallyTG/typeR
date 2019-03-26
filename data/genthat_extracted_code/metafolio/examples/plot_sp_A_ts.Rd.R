library(metafolio)


### Name: plot_sp_A_ts
### Title: Plot sample time series from a portfolio simulation
### Aliases: plot_sp_A_ts

### ** Examples

w_plans <- list()
w_plans[[1]] <- c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5)
w_plans[[2]] <- c(5, 5, 5, 1000, 1000, 1000, 1000, 5, 5, 5)
w_plans[[3]] <- c(rep(1000, 4), rep(5, 6))
w_plans[[4]] <- rev(w_plans[[3]])
w <- list()
for(i in 1:4) { # loop over plans
 w[[i]] <- list()
 for(j in 1:2) { # loop over trials
   w[[i]][[j]] <- matrix(w_plans[[i]], nrow = 1)
 }
}

cons_arma_ts <- list()
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
for(i in 1:4) {
  use_cache <- ifelse(i == 1, FALSE, TRUE)
  cons_arma_ts[[i]] <- meta_sim(b = w[[i]][[1]], n_pop = 10, env_params =
    arma_env_params, env_type = "arma", assess_freq = 5,
    use_cache = use_cache)
}
cols <- RColorBrewer::brewer.pal(5, "Dark2")
par(mfrow = c(2, 1))
plot_sp_A_ts(cons_arma_ts, ylim = c(0000, 12400),
  start_new_plots = c(1, 3),
  labels = c("Balanced response diversity",
    "ignore", "Unbalanced response diversity", "ignore"), cols = cols)



