library(PResiduals)


### Name: partial_Spearman
### Title: Partial Spearman's Rank Correlation
### Aliases: partial_Spearman

### ** Examples

data(PResidData)
#### fitting cumulative probability models for both Y and W
partial_Spearman(c|w ~ z,data=PResidData)
#### fitting a cumulative probability model for W and a poisson model for c
partial_Spearman(c|w~z, fit.x="poisson",data=PResidData)
partial_Spearman(c|w~z, fit.x="poisson", fit.y="lm.emp", data=PResidData )



