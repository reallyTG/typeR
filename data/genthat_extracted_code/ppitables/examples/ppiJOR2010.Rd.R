library(ppitables)


### Name: ppiJOR2010
### Title: ppiJOR2010
### Aliases: ppiJOR2010
### Keywords: datasets

### ** Examples

  # Access Jordan PPI table
  ppiJOR2010

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiJOR2010[ppiJOR2010$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiJOR2010, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiJOR2010[ppiJOR2010$score == ppiScore, "extreme"]




