library(bayesplot)


### Name: MCMC-recover
### Title: Compare MCMC estimates to "true" parameter values
### Aliases: MCMC-recover mcmc_recover_intervals mcmc_recover_scatter
###   mcmc_recover_hist

### ** Examples

## Not run: 
##D library(rstanarm)
##D alpha <- 1; beta <- rnorm(10, 0, 3); sigma <- 2
##D X <- matrix(rnorm(1000), 100, 10)
##D y <- rnorm(100, mean = c(alpha + X %*% beta), sd = sigma)
##D fit <- stan_glm(y ~ ., data = data.frame(y, X))
##D draws <- as.matrix(fit)
##D print(colnames(draws))
##D true <- c(alpha, beta, sigma)
##D 
##D mcmc_recover_intervals(draws, true)
##D 
##D # put the coefficients on X into the same batch
##D mcmc_recover_intervals(draws, true, batch = c(1, rep(2, 10), 1))
##D # equivalent
##D mcmc_recover_intervals(draws, true, batch = grepl("X", colnames(draws)))
##D # same but facets stacked vertically
##D mcmc_recover_intervals(draws, true,
##D                        batch = grepl("X", colnames(draws)),
##D                        facet_args = list(ncol = 1),
##D                        size = 3)
##D 
##D # each parameter in its own facet
##D mcmc_recover_intervals(draws, true, batch = 1:ncol(draws))
##D # same but in a different order
##D mcmc_recover_intervals(draws, true, batch = c(1, 3, 4, 2, 5:12))
##D # present as bias by centering with true values
##D mcmc_recover_intervals(sweep(draws, 2, true), rep(0, ncol(draws))) + hline_0()
##D 
##D 
##D # scatterplot of posterior means vs true values
##D mcmc_recover_scatter(draws, true, point_est = "mean")
##D 
##D 
##D # histograms of parameter draws with true value added as vertical line
##D color_scheme_set("brightblue")
##D mcmc_recover_hist(draws[, 1:4], true[1:4])
## End(Not run)




