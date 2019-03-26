library(StatRank)


### Name: Visualization.Pairwise.Probabilities
### Title: Creates pairwise matrices to compare inference results with the
###   empirical pairwise probabilities
### Aliases: Visualization.Pairwise.Probabilities

### ** Examples

library(ggplot2)
library(gridExtra)
data(Data.Test)
Data.Test.pairs <- Breaking(Data.Test, "full")
Parameters <- Estimation.PL.GMM(Data.Test.pairs, 5)$Parameters
PL.Pairwise.Prob <- function(a, b) a$Mean / (a$Mean + b$Mean)
Visualization.Pairwise.Probabilities(Data.Test.pairs, Parameters, PL.Pairwise.Prob, "PL")



