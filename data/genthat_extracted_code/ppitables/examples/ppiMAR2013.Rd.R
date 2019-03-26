library(ppitables)


### Name: ppiMAR2013
### Title: ppiMAR2013
### Aliases: ppiMAR2013
### Keywords: datasets

### ** Examples

  # Access Morocco PPI table
  ppiMAR2013

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiMAR2013[ppiMAR2013$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiMAR2013, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiMAR2013[ppiMAR2013$score == ppiScore, "nl100"]




