library(padr)


### Name: center_interval
### Title: Shift to the middle of each interval
### Aliases: center_interval

### ** Examples

library(dplyr)
library(ggplot2)
plot_set <- emergency %>%
  thicken("hour", "h") %>%
  count(h) %>%
  head(24)

ggplot(plot_set, aes(h, n)) + geom_col()

plot_set %>%
  mutate(h_center = center_interval(h)) %>%
  ggplot(aes(h_center, n)) + geom_col()



