library(tidybayes)


### Name: geom_eye
### Title: Eye plots of densities with point and interval summaries (ggplot
###   geom)
### Aliases: geom_eye geom_eyeh
### Keywords: manip

### ** Examples


library(magrittr)
library(ggplot2)

data(RankCorr, package = "tidybayes")

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  ggplot(aes(y = i, x = u_tau)) +
  geom_eyeh()

RankCorr %>%
  spread_draws(u_tau[i]) %>%
  ggplot(aes(x = i, y = u_tau)) +
  geom_eye()




