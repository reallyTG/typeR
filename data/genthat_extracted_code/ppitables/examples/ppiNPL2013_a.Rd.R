library(ppitables)


### Name: ppiNPL2013_a
### Title: ppiNPL2013_a
### Aliases: ppiNPL2013_a
### Keywords: datasets

### ** Examples

  # Access Nepal PPI table
  ppiNPL2013_a

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiNPL2013_a[ppiNPL2013_a$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiNPL2013_a, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiNPL2013_a[ppiNPL2013_a$score == ppiScore, "nl100"]




