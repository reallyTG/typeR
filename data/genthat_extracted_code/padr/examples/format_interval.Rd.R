library(padr)


### Name: format_interval
### Title: Make a period character vector
### Aliases: format_interval

### ** Examples

library(dplyr)
library(ggplot2)
plot_set <- emergency %>%
  head(500) %>%
  thicken("hour", "h") %>%
  count(h)

# this will show the data on the full hour
ggplot(plot_set, aes(h, n)) + geom_col()

# adding a character to indicate the hours of the interval.
plot_set %>%
  mutate(h_int = format_interval(h, "%H", sep = "-"))



