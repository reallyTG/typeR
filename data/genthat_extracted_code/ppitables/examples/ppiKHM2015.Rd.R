library(ppitables)


### Name: ppiKHM2015
### Title: ppiKHM2015
### Aliases: ppiKHM2015
### Keywords: datasets

### ** Examples

  # Access Cambodia PPI table
  ppiKHM2015

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiKHM2015[ppiKHM2015$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiKHM2015, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiKHM2015[ppiKHM2015$score == ppiScore, "nl100"]




