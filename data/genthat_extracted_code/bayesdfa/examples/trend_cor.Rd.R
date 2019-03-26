library(bayesdfa)


### Name: trend_cor
### Title: Estimate the correlation between a DFA trend and some other
###   timeseries
### Aliases: trend_cor

### ** Examples

set.seed(1)
s <- sim_dfa(num_trends = 1, num_years = 15)
m <- fit_dfa(y = s$y_sim, num_trends = 1, iter = 500, chains = 1)
r <- rotate_trends(m)
n_years <- ncol(r$trends[,1,])
fake_dat <- rnorm(n_years, 0, 1)
correlation <- trend_cor(r, fake_dat, trend_samples = 25)
hist(correlation)
correlation <- trend_cor(r, y = fake_dat, time_window = 5:15,
  trend_samples = 25)
hist(correlation)



