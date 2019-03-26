library(ppitables)


### Name: ppiBOL2015
### Title: ppiBOL2015
### Aliases: ppiBOL2015
### Keywords: datasets

### ** Examples

  # Access Bolivia PPI table
  ppiBOL2015

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiBOL2015[ppiBOL2015$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiBOL2015, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the food
  # poverty line definition
  ppiScore <- 50
  ppiBOL2015[ppiBOL2015$score == ppiScore, "nlFood"]




