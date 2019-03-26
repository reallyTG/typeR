library(tidybayes)


### Name: geom_halfeyeh
### Title: Half-eye plots of densities with point and interval summaries
###   (ggplot geom)
### Aliases: geom_halfeyeh
### Keywords: manip

### ** Examples


library(magrittr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  ggplot(aes(y = i, x = u_tau)) +
  geom_halfeyeh()




