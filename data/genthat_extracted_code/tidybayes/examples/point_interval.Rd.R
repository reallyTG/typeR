library(tidybayes)


### Name: point_interval
### Title: Point and interval summaries for tidy data frames of draws from
###   distributions
### Aliases: point_interval point_interval.default point_interval.numeric
###   point_intervalh qi hdi Mode hdci mean_qi mean_qih median_qi
###   median_qih mode_qi mode_qih mean_hdi mean_hdih median_hdi median_hdih
###   mode_hdi mode_hdih mean_hdci mean_hdcih median_hdci median_hdcih
###   mode_hdci mode_hdcih

### ** Examples


library(dplyr)
library(ggplot2)

set.seed(123)

rnorm(1000) %>%
  median_qi()

data.frame(x = rnorm(1000)) %>%
  median_qi(x, .width = c(.50, .80, .95))

data.frame(
    x = rnorm(1000),
    y = rnorm(1000, mean = 2, sd = 2)
  ) %>%
  median_qi(x, y)

data.frame(
    x = rnorm(1000),
    group = "a"
  ) %>%
  rbind(data.frame(
    x = rnorm(1000, mean = 2, sd = 2),
    group = "b")
  ) %>%
  group_by(group) %>%
  median_qi(.width = c(.50, .80, .95))

multimodal_draws = data.frame(
    x = c(rnorm(5000, 0, 1), rnorm(2500, 4, 1))
  )

multimodal_draws %>%
  mode_hdi(.width = c(.66, .95))

multimodal_draws %>%
  ggplot(aes(x = x, y = 0)) +
  geom_halfeyeh(fun.data = mode_hdih, .width = c(.66, .95))




