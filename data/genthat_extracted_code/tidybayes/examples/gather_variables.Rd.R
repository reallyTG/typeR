library(tidybayes)


### Name: gather_variables
### Title: Gather variables from a tidy data frame of draws from variables
###   into a single column
### Aliases: gather_variables
### Keywords: manip

### ** Examples

## No test: 

library(dplyr)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(b[i,v], tau[i]) %>%
  gather_variables() %>%
  median_qi()

# the first three lines below are roughly equivalent to ggmcmc::ggs(RankCorr)
RankCorr %>%
  tidy_draws() %>%
  gather_variables() %>%
  median_qi()

## End(No test)



