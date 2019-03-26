library(ppitables)


### Name: ppiBFA2017
### Title: ppiBFA2017
### Aliases: ppiBFA2017
### Keywords: datasets

### ** Examples

  # Access Burkina Faso PPI table
  ppiBFA2017

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiBFA2017[ppiBFA2017$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiBFA2017, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiBFA2017[ppiBFA2017$score == ppiScore, "nl100"]




