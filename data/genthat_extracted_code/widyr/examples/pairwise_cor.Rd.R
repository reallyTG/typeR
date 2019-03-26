library(widyr)


### Name: pairwise_cor
### Title: Correlations of pairs of items
### Aliases: pairwise_cor pairwise_cor_

### ** Examples


library(dplyr)
library(gapminder)

gapminder %>%
  pairwise_cor(country, year, lifeExp)

gapminder %>%
  pairwise_cor(country, year, lifeExp, sort = TRUE)

# United Nations voting data
library(unvotes)

country_cors <- un_votes %>%
  mutate(vote = as.numeric(vote)) %>%
  pairwise_cor(country, rcid, vote, sort = TRUE)

country_cors




