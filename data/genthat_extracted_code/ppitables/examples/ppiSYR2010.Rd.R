library(ppitables)


### Name: ppiSYR2010
### Title: ppiSYR2010
### Aliases: ppiSYR2010
### Keywords: datasets

### ** Examples

  # Access Syria PPI table
  ppiSYR2010

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiSYR2010[ppiSYR2010$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiSYR2010, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiSYR2010[ppiSYR2010$score == ppiScore, "nl100"]




