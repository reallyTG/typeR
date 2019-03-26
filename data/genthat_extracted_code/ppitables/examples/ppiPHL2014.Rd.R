library(ppitables)


### Name: ppiPHL2014
### Title: ppiPHL2014
### Aliases: ppiPHL2014
### Keywords: datasets

### ** Examples

  # Access Philippines PPI table
  ppiPHL2014

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiPHL2014[ppiPHL2014$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiPHL2014, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiPHL2014[ppiPHL2014$score == ppiScore, "nl100"]




