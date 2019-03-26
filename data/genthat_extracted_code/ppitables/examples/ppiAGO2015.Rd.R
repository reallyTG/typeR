library(ppitables)


### Name: ppiAGO2015
### Title: ppiAGO2015
### Aliases: ppiAGO2015
### Keywords: datasets

### ** Examples

  # Access Angola PPI table
  ppiAGO2015

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiAGO2015[ppiAGO2015$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiAGO2015, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiAGO2015[ppiAGO2015$score == ppiScore, "extreme"]




