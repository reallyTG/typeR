library(ppitables)


### Name: ppiCIV2013
### Title: ppiCIV2013
### Aliases: ppiCIV2013
### Keywords: datasets

### ** Examples

  # Access Ivory Coast PPI table
  ppiCIV2013

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiCIV2013[ppiCIV2013$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiCIV2013, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiCIV2013[ppiCIV2013$score == ppiScore, "extreme"]




