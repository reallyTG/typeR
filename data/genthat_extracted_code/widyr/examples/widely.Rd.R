library(widyr)


### Name: widely
### Title: Adverb for functions that operate on matrices in "wide" format
### Aliases: widely widely_

### ** Examples


library(dplyr)
library(gapminder)

gapminder

gapminder %>%
  widely(dist)(country, year, lifeExp)

# can perform within groups
closest_continent <- gapminder %>%
  group_by(continent) %>%
  widely(dist)(country, year, lifeExp)
closest_continent

# for example, find the closest pair in each
closest_continent %>%
  top_n(1, -value)




