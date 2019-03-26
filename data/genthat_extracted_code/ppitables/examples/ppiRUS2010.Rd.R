library(ppitables)


### Name: ppiRUS2010
### Title: ppiRUS2010
### Aliases: ppiRUS2010
### Keywords: datasets

### ** Examples

  # Access Russia PPI table
  ppiRUS2010

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiRUS2010[ppiRUS2010$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiRUS2010, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiRUS2010[ppiRUS2010$score == ppiScore, "nl100"]




