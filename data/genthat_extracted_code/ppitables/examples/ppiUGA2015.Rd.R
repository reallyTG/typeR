library(ppitables)


### Name: ppiUGA2015
### Title: ppiUGA2015
### Aliases: ppiUGA2015
### Keywords: datasets

### ** Examples

  # Access Uganda PPI table
  ppiUGA2015

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiUGA2015[ppiUGA2015$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiUGA2015, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiUGA2015[ppiUGA2015$score == ppiScore, "nl100"]




