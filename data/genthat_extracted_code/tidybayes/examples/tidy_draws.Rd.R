library(tidybayes)


### Name: tidy_draws
### Title: Get a sample of posterior draws from a model as a tibble
### Aliases: tidy_draws tidy_draws.default tidy_draws.mcmc.list
###   tidy_draws.stanfit tidy_draws.stanreg tidy_draws.runjags
###   tidy_draws.jagsUI tidy_draws.brmsfit tidy_draws.matrix
###   tidy_draws.MCMCglmm
### Keywords: manip

### ** Examples


library(magrittr)

data(line, package = "coda")

line %>%
  tidy_draws()




