library(ppitables)


### Name: ppiTZA2016
### Title: ppiTZA2016
### Aliases: ppiTZA2016
### Keywords: datasets

### ** Examples

  # Access Tanzania PPI table
  ppiTZA2016

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiTZA2016[ppiTZA2016$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiTZA2016, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiTZA2016[ppiTZA2016$score == ppiScore, "nl100"]




