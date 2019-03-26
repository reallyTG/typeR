library(StatRank)


### Name: Evaluation.MSE
### Title: Calculates MSE between empirical pairwise preferences and
###   modeled pairwise preferences
### Aliases: Evaluation.MSE

### ** Examples

data(Data.Test)
Data.Test.pairs <- Breaking(Data.Test, "full")
m <- 5
Estimate <- Estimation.PL.GMM(Data.Test.pairs, m)
Evaluation.MSE(Data.Test.pairs, m, Estimate, PL.Pairwise.Prob)



