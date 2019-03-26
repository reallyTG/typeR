library(ppitables)


### Name: ppiFJI2014
### Title: ppiFJI2014
### Aliases: ppiFJI2014
### Keywords: datasets

### ** Examples

  # Access Fiji PPI table
  ppiFJI2014

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiFJI2014[ppiFJI2014$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiFJI2014, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiFJI2014[ppiFJI2014$score == ppiScore, "nl100"]




