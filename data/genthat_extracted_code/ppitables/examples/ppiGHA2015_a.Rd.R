library(ppitables)


### Name: ppiGHA2015_a
### Title: ppiGHA2015_a
### Aliases: ppiGHA2015_a
### Keywords: datasets

### ** Examples

  # Access Ghana PPI table
  ppiGHA2015_a

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiGHA2015_a[ppiGHA2015_a$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiGHA2015_a, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiGHA2015_a[ppiGHA2015_a$score == ppiScore, "nl100"]




