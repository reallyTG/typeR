library(tidybayes)


### Name: geom_lineribbon
### Title: Line + multiple probability ribbon plots (ggplot geom)
### Aliases: geom_lineribbon
### Keywords: manip

### ** Examples


library(dplyr)
library(ggplot2)

data_frame(x = 1:10) %>%
  group_by_all() %>%
  do(data_frame(y = rnorm(100, .$x))) %>%
  median_qi(.width = c(.5, .8, .95)) %>%
  ggplot(aes(x = x, y = y)) +
  # automatically uses aes(ymin = .lower, ymax = .upper, fill = fct_rev(ordered(.width)))
  geom_lineribbon() +
  scale_fill_brewer()




