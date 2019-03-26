library(widyr)


### Name: squarely
### Title: A special case of the widely adverb for creating tidy square
###   matrices
### Aliases: squarely squarely_

### ** Examples


library(dplyr)
library(gapminder)

closest_continent <- gapminder %>%
  group_by(continent) %>%
  squarely(dist)(country, year, lifeExp)




