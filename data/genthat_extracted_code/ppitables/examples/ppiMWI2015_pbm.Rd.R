library(ppitables)


### Name: ppiMWI2015_pbm
### Title: ppiMWI2015_pbm
### Aliases: ppiMWI2015_pbm
### Keywords: datasets

### ** Examples

  # Access Malawi PPI table
  ppiMWI2015_pbm

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiMWI2015_pbm[ppiMWI2015_pbm$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiMWI2015_pbm, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiMWI2015_pbm[ppiMWI2015_pbm$score == ppiScore, "nl100"]




