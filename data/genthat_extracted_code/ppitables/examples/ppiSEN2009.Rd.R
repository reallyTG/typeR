library(ppitables)


### Name: ppiSEN2009
### Title: ppiSEN2009
### Aliases: ppiSEN2009
### Keywords: datasets

### ** Examples

  # Access Senegal PPI table
  ppiSEN2009

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiSEN2009[ppiSEN2009$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiSEN2009, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiSEN2009[ppiSEN2009$score == ppiScore, "nl100"]




