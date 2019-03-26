library(tidybayes)


### Name: stat_lineribbon
### Title: Line + multiple probability ribbon stat for ggplot
### Aliases: stat_lineribbon

### ** Examples


library(dplyr)
library(ggplot2)

data_frame(x = 1:10) %>%
  group_by_all() %>%
  do(data_frame(y = rnorm(100, .$x))) %>%
  ggplot(aes(x = x, y = y)) +
  stat_lineribbon() +
  scale_fill_brewer()




