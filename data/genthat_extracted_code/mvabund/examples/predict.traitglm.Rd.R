library(mvabund)


### Name: predict.traitglm
### Title: Predictions from fourth corner model fits
### Aliases: predict.traitglm
### Keywords: models regression

### ** Examples

data(antTraits)

# fit a fourth corner model using negative binomial regression via manyglm:
ft=traitglm(antTraits$abund,antTraits$env,antTraits$traits,method="manyglm")
ft$fourth #print fourth corner terms

# predict to the first five sites
predict(ft, newR=antTraits$env[1:5,])




