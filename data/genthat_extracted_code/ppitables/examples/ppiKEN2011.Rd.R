library(ppitables)


### Name: ppiKEN2011
### Title: ppiKEN2011
### Aliases: ppiKEN2011
### Keywords: datasets

### ** Examples

  # Access Kenya PPI table
  ppiKEN2011

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiKEN2011[ppiKEN2011$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiKEN2011, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiKEN2011[ppiKEN2011$score == ppiScore, "extreme"]




