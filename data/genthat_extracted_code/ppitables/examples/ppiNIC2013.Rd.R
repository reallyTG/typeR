library(ppitables)


### Name: ppiNIC2013
### Title: ppiNIC2013
### Aliases: ppiNIC2013
### Keywords: datasets

### ** Examples

  # Access Nicaragua PPI table
  ppiNIC2013

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiNIC2013[ppiNIC2013$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiNIC2013, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiNIC2013[ppiNIC2013$score == ppiScore, "nl100"]




