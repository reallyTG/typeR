library(ppitables)


### Name: ppiSLE2011
### Title: ppiSLE2011
### Aliases: ppiSLE2011
### Keywords: datasets

### ** Examples

  # Access Sierra Leone PPI table
  ppiSLE2011

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiSLE2011[ppiSLE2011$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiSLE2011, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiSLE2011[ppiSLE2011$score == ppiScore, "nl100"]




