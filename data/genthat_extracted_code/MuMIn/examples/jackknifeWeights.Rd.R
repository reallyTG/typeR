library(MuMIn)


### Name: jackknifeWeights
### Title: Jackknifed model weights
### Aliases: jackknifeWeights
### Keywords: models

### ** Examples

fm <- glm(Prop ~ mortality * dose, binomial(), Beetle, na.action = na.fail)

fits <- lapply(dredge(fm, eval = FALSE), eval)

amJk <- amAICc <- model.avg(fits)
set.seed(666)
Weights(amJk) <- jackknifeWeights(fits, data = Beetle)

coef(amJk)
coef(amAICc)




