library(tidybayes)


### Name: compare_levels
### Title: Compare the value of draws of some variable from a Bayesian
###   model for different levels of a factor
### Aliases: compare_levels
### Keywords: manip

### ** Examples


library(dplyr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

# Let's do all pairwise comparisons of b[i,1]:
RankCorr %>%
  spread_draws(b[i,j]) %>%
  filter(j == 1) %>%
  compare_levels(b, by = i) %>%
  median_qi()

# Or let's plot all comparisons against the first level (control):
RankCorr %>%
  spread_draws(b[i,j]) %>%
  filter(j == 1) %>%
  compare_levels(b, by = i, comparison = control) %>%
  ggplot(aes(x = b, y = i)) +
  geom_halfeyeh()

# Or let's plot comparisons of all levels of j within
# all levels of i
RankCorr %>%
  spread_draws(b[i,j]) %>%
  group_by(i) %>%
  compare_levels(b, by = j) %>%
  ggplot(aes(x = b, y = j)) +
  geom_halfeyeh() +
  facet_grid(cols = vars(i))




