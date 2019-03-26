library(MuMIn)


### Name: arm.glm
### Title: Adaptive Regression by Mixing
### Aliases: arm.glm armWeights
### Keywords: models

### ** Examples

fm <- glm(y ~ X1 + X2 + X3 + X4, data = Cement)

summary(am1 <- arm.glm(fm, R = 15))

mst <- dredge(fm)

am2 <- model.avg(mst, fit = TRUE)

Weights(am2) <- armWeights(am2, data = Cement, R = 15)

# differences are due to small R:
coef(am1, full = TRUE)
coef(am2, full = TRUE)





