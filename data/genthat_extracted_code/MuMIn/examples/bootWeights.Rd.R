library(MuMIn)


### Name: bootWeights
### Title: Bootstrap model weights
### Aliases: bootWeights
### Keywords: models

### ** Examples

# To speed up the bootstrap, use 'x = TRUE' so that model matrix is included
#     in the returned object
fm <- glm(Prop ~ mortality + dose, family = binomial, data = Beetle, 
   na.action = na.fail, x = TRUE)

fml <- lapply(dredge(fm, eval = FALSE), eval)
am <- model.avg(fml)

Weights(am) <- bootWeights(am, data = Beetle, R = 25)

summary(am)




