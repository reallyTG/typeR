library(ggthemes)


### Name: theme_fivethirtyeight
### Title: Theme inspired by fivethirtyeight.com plots
### Aliases: theme_fivethirtyeight

### ** Examples

library("ggplot2")
p <- ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(gear))) +
  geom_point() +
  facet_wrap(~am) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_fivethirtyeight() +
  theme_fivethirtyeight()
p



