library(ppitables)


### Name: ppiIDN2012_a
### Title: ppiIDN2012_a
### Aliases: ppiIDN2012_a
### Keywords: datasets

### ** Examples

  # Access Indonesia PPI table
  ppiIDN2012_a

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiIDN2012_a[ppiIDN2012_a$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiIDN2012_a, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiIDN2012_a[ppiIDN2012_a$score == ppiScore, "extreme"]




