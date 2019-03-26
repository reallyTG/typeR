library(StatRank)


### Name: Estimation.RUM.MLE
### Title: Performs parameter estimation for a Random Utility Model with
###   different noise distributions
### Aliases: Estimation.RUM.MLE

### ** Examples

Data.Tiny <- matrix(c(1, 2, 3, 3, 2, 1, 1, 2, 3), ncol = 3, byrow = TRUE)
Estimation.RUM.MLE(Data.Tiny, iter = 2, dist="norm")



