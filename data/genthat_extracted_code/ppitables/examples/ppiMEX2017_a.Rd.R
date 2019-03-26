library(ppitables)


### Name: ppiMEX2017_a
### Title: ppiMEX2017_a
### Aliases: ppiMEX2017_a
### Keywords: datasets

### ** Examples

  # Access Mexico PPI table
  ppiMEX2017_a

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiMEX2017_a[ppiMEX2017_a$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiMEX2017_a, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiMEX2017_a[ppiMEX2017_a$score == ppiScore, "nl100"]




