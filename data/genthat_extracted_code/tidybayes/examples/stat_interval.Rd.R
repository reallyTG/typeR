library(tidybayes)


### Name: stat_interval
### Title: Multiple probability interval plots (ggplot stat)
### Aliases: stat_interval stat_intervalh

### ** Examples


library(magrittr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  ggplot(aes(y = i, x = u_tau)) +
  stat_intervalh() +
  scale_color_brewer()

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  ggplot(aes(x = i, y = u_tau)) +
  stat_interval() +
  scale_color_brewer()




