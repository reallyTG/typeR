library(ppitables)


### Name: ppiNAM2013
### Title: ppiNAM2013
### Aliases: ppiNAM2013
### Keywords: datasets

### ** Examples

  # Access Namibia PPI table
  ppiNAM2013

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiNAM2013[ppiNAM2013$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiNAM2013, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiNAM2013[ppiNAM2013$score == ppiScore, "nl100"]




