library(ppitables)


### Name: ppiRWA2016
### Title: ppiRWA2016
### Aliases: ppiRWA2016
### Keywords: datasets

### ** Examples

  # Access Rwanda PPI table
  ppiRWA2016

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiRWA2016[ppiRWA2016$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiRWA2016, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiRWA2016[ppiRWA2016$score == ppiScore, "nl100"]




