library(StatRank)


### Name: Likelihood.RUM.Multitype
### Title: Likelihood for Multitype Random Utility Models
### Aliases: Likelihood.RUM.Multitype

### ** Examples

Data.Tiny <- matrix(c(1, 2, 3, 3, 2, 1, 1, 2, 3), ncol = 3, byrow = TRUE)
Estimate <- Estimation.RUM.MultiType.MLE(Data.Tiny, K=2, iter = 1, dist= "norm")
Likelihood.RUM.Multitype(Data.Tiny, Estimate, dist = "norm")



