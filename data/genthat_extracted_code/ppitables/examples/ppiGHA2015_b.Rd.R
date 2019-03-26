library(ppitables)


### Name: ppiGHA2015_b
### Title: ppiGHA2015_b
### Aliases: ppiGHA2015_b
### Keywords: datasets

### ** Examples

  # Access Ghana PPI table
  ppiGHA2015_b

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiGHA2015_b[ppiGHA2015_b$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiGHA2015_b, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the below $1.25
  # per day purchasing power parity (2005)
  ppiScore <- 50
  ppiGHA2015_b[ppiGHA2015_b$score == ppiScore, "ppp125"]




