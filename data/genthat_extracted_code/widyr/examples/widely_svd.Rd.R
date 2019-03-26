library(widyr)


### Name: widely_svd
### Title: Turn into a wide matrix, perform SVD, return to tidy form
### Aliases: widely_svd widely_svd_

### ** Examples


library(dplyr)
library(gapminder)

# principal components driving change
gapminder_svd <- gapminder %>%
  widely_svd(country, year, lifeExp)

gapminder_svd

# compare SVDs, join with other data
library(ggplot2)
library(tidyr)

gapminder_svd %>%
  spread(dimension, value) %>%
  inner_join(distinct(gapminder, country, continent), by = "country") %>%
  ggplot(aes(`1`, `2`, label = country)) +
  geom_point(aes(color = continent)) +
  geom_text(vjust = 1, hjust = 1)




