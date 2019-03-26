## ------------------------------------------------------------------------
library(dplyr)
library(gapminder)

gapminder

## ------------------------------------------------------------------------
library(widyr)

gapminder %>%
  pairwise_dist(country, year, lifeExp)

## ------------------------------------------------------------------------
gapminder %>%
  pairwise_dist(country, year, lifeExp) %>%
  arrange(distance)

## ------------------------------------------------------------------------
gapminder %>%
  pairwise_dist(country, year, lifeExp, upper = FALSE) %>%
  arrange(distance)

## ------------------------------------------------------------------------
gapminder %>%
  pairwise_cor(country, year, lifeExp, upper = FALSE, sort = TRUE)

