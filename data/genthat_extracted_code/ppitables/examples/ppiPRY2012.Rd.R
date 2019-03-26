library(ppitables)


### Name: ppiPRY2012
### Title: ppiPRY2012
### Aliases: ppiPRY2012
### Keywords: datasets

### ** Examples

  # Access Paraguay PPI table
  ppiPRY2012

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiPRY2012[ppiPRY2012$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiPRY2012, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiPRY2012[ppiPRY2012$score == ppiScore, "nl100"]




