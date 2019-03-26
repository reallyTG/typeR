library(tidybayes)


### Name: tidy-format-translators
### Title: Translate between different tidy data frame formats for draws
###   from distributions
### Aliases: tidy-format-translators to_broom_names from_broom_names
###   to_ggmcmc_names from_ggmcmc_names
### Keywords: manip

### ** Examples


library(magrittr)

data(line, package = "coda")

line %>%
  gather_draws(alpha, beta, sigma) %>%
  median_qi() %>%
  to_broom_names()




