library(ppitables)


### Name: ppiLKA2016
### Title: ppiLKA2016
### Aliases: ppiLKA2016
### Keywords: datasets

### ** Examples

  # Access Sri Lanka PPI table
  ppiLKA2016

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiLKA2016[ppiLKA2016$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiLKA2016, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiLKA2016[ppiLKA2016$score == ppiScore, "nl100"]




