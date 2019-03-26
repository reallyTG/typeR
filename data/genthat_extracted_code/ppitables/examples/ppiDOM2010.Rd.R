library(ppitables)


### Name: ppiDOM2010
### Title: ppiDOM2010
### Aliases: ppiDOM2010
### Keywords: datasets

### ** Examples

  # Access Dominican Republic PPI table
  ppiDOM2010

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiDOM2010[ppiDOM2010$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiDOM2010, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiDOM2010[ppiDOM2010$score == ppiScore, "extreme"]




