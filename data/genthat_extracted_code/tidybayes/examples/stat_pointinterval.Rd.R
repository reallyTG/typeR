library(tidybayes)


### Name: stat_pointinterval
### Title: Point summary + multiple probability interval plots (ggplot
###   stat)
### Aliases: stat_pointinterval stat_pointintervalh

### ** Examples


library(magrittr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  ggplot(aes(y = i, x = u_tau)) +
  stat_pointintervalh(.width = c(.66, .95))

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  ggplot(aes(x = i, y = u_tau)) +
  stat_pointinterval(.width = c(.66, .95))




