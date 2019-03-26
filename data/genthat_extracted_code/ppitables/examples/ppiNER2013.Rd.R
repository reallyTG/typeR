library(ppitables)


### Name: ppiNER2013
### Title: ppiNER2013
### Aliases: ppiNER2013
### Keywords: datasets

### ** Examples

  # Access Niger PPI table
  ppiNER2013

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiNER2013[ppiNER2013$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiNER2013, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiNER2013[ppiNER2013$score == ppiScore, "nl100"]




