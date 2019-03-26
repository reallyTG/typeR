library(StatRank)


### Name: Evaluation.TVD
### Title: Calculates TVD between empirical pairwise preferences and
###   modeled pairwise preferences
### Aliases: Evaluation.TVD

### ** Examples

data(Data.Test)
Data.Test.pairs <- Breaking(Data.Test, "full")
m <- 5
Estimate <- Estimation.PL.GMM(Data.Test.pairs, m)
Evaluation.TVD(Data.Test.pairs, m, Estimate, PL.Pairwise.Prob)



