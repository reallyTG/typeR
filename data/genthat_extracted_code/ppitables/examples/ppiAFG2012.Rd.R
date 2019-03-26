library(ppitables)


### Name: ppiAFG2012
### Title: ppiAFG2012
### Aliases: ppiAFG2012
### Keywords: datasets

### ** Examples

  # Access Afghanistan PPI table
  ppiAFG2012

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiAFG2012[ppiAFG2012$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiAFG2012, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiAFG2012[ppiAFG2012$score == ppiScore, "extreme"]




