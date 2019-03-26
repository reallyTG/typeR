library(ppitables)


### Name: ppiKHM2015_wb
### Title: ppiKHM2015_wb
### Aliases: ppiKHM2015_wb
### Keywords: datasets

### ** Examples

  # Access Cambodia PPI table
  ppiKHM2015_wb

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiKHM2015_wb[ppiKHM2015_wb$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiKHM2015_wb, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiKHM2015_wb[ppiKHM2015_wb$score == ppiScore, "nl100"]




