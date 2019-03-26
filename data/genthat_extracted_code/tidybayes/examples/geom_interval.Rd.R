library(tidybayes)


### Name: geom_interval
### Title: Multiple probability interval plots (ggplot geom)
### Aliases: geom_interval geom_intervalh
### Keywords: manip

### ** Examples


library(magrittr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  median_qi(.width = c(.5, .8, .95, .99)) %>%
  ggplot(aes(y = i, x = u_tau)) +
  geom_intervalh() +
  scale_color_brewer()

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  median_qi(.width = c(.5, .8, .95, .99)) %>%
  ggplot(aes(x = i, y = u_tau)) +
  geom_interval() +
  scale_color_brewer()




