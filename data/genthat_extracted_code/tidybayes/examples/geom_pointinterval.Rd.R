library(tidybayes)


### Name: geom_pointinterval
### Title: Point + multiple probability interval plots (ggplot geom)
### Aliases: geom_pointinterval geom_pointintervalh
### Keywords: manip

### ** Examples


library(magrittr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  median_qi(.width = c(.8, .95)) %>%
  ggplot(aes(y = i, x = u_tau)) +
  geom_pointintervalh()

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  median_qi(.width = c(.8, .95)) %>%
  ggplot(aes(x = i, y = u_tau)) +
  geom_pointinterval()




