library(ppitables)


### Name: ppiROU2009
### Title: ppiROU2009
### Aliases: ppiROU2009
### Keywords: datasets

### ** Examples

  # Access Romania PPI table
  ppiROU2009

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiROU2009[ppiROU2009$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiROU2009, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiROU2009[ppiROU2009$score == ppiScore, "nl100"]




