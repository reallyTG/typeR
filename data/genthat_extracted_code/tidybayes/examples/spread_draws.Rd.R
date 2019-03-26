library(tidybayes)


### Name: gather_draws
### Title: Extract draws of variables in a Bayesian model fit into a tidy
###   data format
### Aliases: gather_draws spread_draws
### Keywords: manip

### ** Examples


library(dplyr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(b[i, j])

RankCorr %>%
  spread_draws(b[i, j], tau[i], u_tau[i])


RankCorr %>%
  gather_draws(b[i, j], tau[i], u_tau[i])

RankCorr %>%
  gather_draws(tau[i], typical_r) %>%
  median_qi()




