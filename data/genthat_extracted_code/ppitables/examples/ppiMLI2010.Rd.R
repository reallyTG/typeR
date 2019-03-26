library(ppitables)


### Name: ppiMLI2010
### Title: ppiMLI2010
### Aliases: ppiMLI2010
### Keywords: datasets

### ** Examples

  # Access Mali PPI table
  ppiMLI2010

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiMLI2010[ppiMLI2010$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiMLI2010, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiMLI2010[ppiMLI2010$score == ppiScore, "nl100"]




