library(ppitables)


### Name: ppiTLS2013
### Title: ppiTLS2013
### Aliases: ppiTLS2013
### Keywords: datasets

### ** Examples

  # Access Timor Leste PPI table
  ppiTLS2013

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiTLS2013[ppiTLS2013$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiTLS2013, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the national
  # poverty line definition
  ppiScore <- 50
  ppiTLS2013[ppiTLS2013$score == ppiScore, "nl100"]




