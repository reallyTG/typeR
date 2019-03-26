library(ppitables)


### Name: ppiGTM2016
### Title: ppiGTM2016
### Aliases: ppiGTM2016
### Keywords: datasets

### ** Examples

  # Access Guatemala PPI table
  ppiGTM2016

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiGTM2016[ppiGTM2016$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiGTM2016, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiGTM2016[ppiGTM2016$score == ppiScore, "nl100"]




