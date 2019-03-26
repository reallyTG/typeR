library(flexmix)


### Name: tribolium
### Title: Tribolium Beetles
### Aliases: tribolium
### Keywords: datasets

### ** Examples

data("tribolium", package = "flexmix")
tribMix <- initFlexmix(cbind(Remaining, Total - Remaining) ~ Species, 
                   k = 2, nrep = 5, data = tribolium,
                   model = FLXMRglm(family = "binomial"))



