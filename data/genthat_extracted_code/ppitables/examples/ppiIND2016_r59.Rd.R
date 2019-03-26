library(ppitables)


### Name: ppiIND2016_r59
### Title: ppiIND2016_r59
### Aliases: ppiIND2016_r59
### Keywords: datasets

### ** Examples

  # Access India PPI table
  ppiIND2016_r59

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiIND2016_r59[ppiIND2016_r59$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiIND2016_r59, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the saxena
  # poverty definition
  ppiScore <- 50
  ppiIND2016_r59[ppiIND2016_r59$score == ppiScore, "saxena"]




