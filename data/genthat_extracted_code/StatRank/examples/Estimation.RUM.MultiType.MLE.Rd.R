library(StatRank)


### Name: Estimation.RUM.MultiType.MLE
### Title: Performs parameter estimation for a Multitype Random Utility
###   Model
### Aliases: Estimation.RUM.MultiType.MLE

### ** Examples

Data.Tiny <- matrix(c(1, 2, 3, 3, 2, 1, 1, 2, 3), ncol = 3, byrow = TRUE)
Estimation.RUM.MultiType.MLE(Data.Tiny, K=2, iter = 3, dist= "norm.fixedvariance")



