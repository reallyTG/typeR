library(StatRank)


### Name: generateC.model
### Title: Turns inference object into modeled C matrix.
### Aliases: generateC.model

### ** Examples

data(Data.Test)
Data.Test.pairs <- Breaking(Data.Test, "full")
Estimate <- Estimation.Normal.GMM(Data.Test.pairs, 5)
generateC.model(Estimate, Normal.Pairwise.Prob)



