library(StatRank)


### Name: Evaluation.KL
### Title: Calculates KL divergence between empirical pairwise preferences
###   and modeled pairwise preferences
### Aliases: Evaluation.KL

### ** Examples

data(Data.Test)
Data.Test.pairs <- Breaking(Data.Test, "full")
m <- 5
Estimate <- Estimation.PL.GMM(Data.Test.pairs, m)
Evaluation.KL(Data.Test.pairs, m, Estimate, PL.Pairwise.Prob)



