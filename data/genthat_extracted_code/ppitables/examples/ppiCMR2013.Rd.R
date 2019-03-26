library(ppitables)


### Name: ppiCMR2013
### Title: ppiCMR2013
### Aliases: ppiCMR2013
### Keywords: datasets

### ** Examples

  # Access Cameroon PPI table
  ppiCMR2013

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiCMR2013[ppiCMR2013$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiCMR2013, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiCMR2013[ppiCMR2013$score == ppiScore, "extreme"]




