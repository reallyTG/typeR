library(StatRank)


### Name: Estimation.PL.GMM
### Title: GMM Method for estimating Plackett-Luce model parameters
### Aliases: Estimation.PL.GMM

### ** Examples

data(Data.Test)
Data.Test.pairs <- Breaking(Data.Test, "full")
Estimation.PL.GMM(Data.Test.pairs, 5)



