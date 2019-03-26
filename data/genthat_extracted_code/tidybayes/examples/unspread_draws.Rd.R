library(tidybayes)


### Name: ungather_draws
### Title: Turn tidy data frames of variables from a Bayesian model back
###   into untidy data
### Aliases: ungather_draws unspread_draws
### Keywords: manip

### ** Examples


library(dplyr)

data(RankCorr, package = "tidybayes")

# We can use unspread_draws to allow us to manipulate draws with tidybayes
# and then transform the draws into a form we can use with packages like bayesplot.
# Here we subset b[i,j] to just values of i in 1:2 and j == 1, then plot with bayesplot
RankCorr %>%
  spread_draws(b[i,j]) %>%
  filter(i %in% 1:2, j == 1) %>%
  unspread_draws(b[i,j], drop_indices = TRUE) %>%
  bayesplot::mcmc_areas()

# As another example, we could use compare_levels to plot all pairwise comparisons
# of b[1,j] for j in 1:3
RankCorr %>%
  spread_draws(b[i,j]) %>%
  filter(i == 1, j %in% 1:3) %>%
  compare_levels(b, by = j) %>%
  unspread_draws(b[j], drop_indices = TRUE) %>%
  bayesplot::mcmc_areas()




