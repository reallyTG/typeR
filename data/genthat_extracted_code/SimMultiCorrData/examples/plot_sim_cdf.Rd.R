library(SimMultiCorrData)


### Name: plot_sim_cdf
### Title: Plot Simulated (Empirical) Cumulative Distribution Function for
###   Continuous, Ordinal, or Count Variables
### Aliases: plot_sim_cdf
### Keywords: cdf empirical, plot, simulated,

### ** Examples

## Not run: 
##D # Logistic Distribution: mean = 0, variance = 1
##D seed = 1234
##D 
##D # Find standardized cumulants
##D stcum <- calc_theory(Dist = "Logistic", params = c(0, 1))
##D 
##D # Simulate without the sixth cumulant correction
##D # (invalid power method pdf)
##D Logvar1 <- nonnormvar1(method = "Polynomial", means = 0, vars = 1,
##D                       skews = stcum[3], skurts = stcum[4],
##D                       fifths = stcum[5], sixths = stcum[6], seed = seed)
##D 
##D # Plot cdf with cumulative probability calculated up to delta = 5
##D plot_sim_cdf(sim_y = Logvar1$continuous_variable,
##D              title = "Invalid Logistic Empirical CDF",
##D              calc_cprob = TRUE, delta = 5)
##D 
##D # Simulate with the sixth cumulant correction
##D # (valid power method pdf)
##D Logvar2 <- nonnormvar1(method = "Polynomial", means = 0, vars = 1,
##D                       skews = stcum[3], skurts = stcum[4],
##D                       fifths = stcum[5], sixths = stcum[6],
##D                       Six = seq(1.5, 2, 0.05), seed = seed)
##D 
##D # Plot cdf with cumulative probability calculated up to delta = 5
##D plot_sim_cdf(sim_y = Logvar2$continuous_variable,
##D              title = "Valid Logistic Empirical CDF",
##D              calc_cprob = TRUE, delta = 5)
##D 
##D # Simulate one binary and one ordinal variable (4 categories) with
##D # correlation 0.3
##D Ordvars = rcorrvar(k_cat = 2, marginal = list(0.4, c(0.2, 0.5, 0.7)),
##D                    rho = matrix(c(1, 0.3, 0.3, 1), 2, 2), seed = seed)
##D 
##D # Plot cdf of 2nd variable
##D plot_sim_cdf(Ordvars$ordinal_variables[, 2])
##D 
## End(Not run)




