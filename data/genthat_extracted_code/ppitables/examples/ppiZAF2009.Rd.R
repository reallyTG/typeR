library(ppitables)


### Name: ppiZAF2009
### Title: ppiZAF2009
### Aliases: ppiZAF2009
### Keywords: datasets

### ** Examples

  # Access South Africa PPI table
  ppiZAF2009

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiZAF2009[ppiZAF2009$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiZAF2009, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiZAF2009[ppiZAF2009$score == ppiScore, "nl100"]




