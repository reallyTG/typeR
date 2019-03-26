library(ppitables)


### Name: ppiMWI2015
### Title: ppiMWI2015
### Aliases: ppiMWI2015
### Keywords: datasets

### ** Examples

  # Access Malawi PPI table
  ppiMWI2015

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiMWI2015[ppiMWI2015$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiMWI2015, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, below $1.25
  # purchasing power parity (2005)
  ppiScore <- 50
  ppiMWI2015[ppiMWI2015$score == ppiScore, "ppp125"]




