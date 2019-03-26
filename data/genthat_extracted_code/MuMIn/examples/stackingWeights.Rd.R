library(MuMIn)


### Name: stackingWeights
### Title: Stacking model weights
### Aliases: stackingWeights
### Keywords: models

### ** Examples

# global model fitted to training data:
fm <- glm(y ~ X1 + X2 + X3 + X4, data = Cement, na.action = na.fail)
# generate a list of *some* subsets of the global model
models <- lapply(dredge(fm, evaluate = FALSE, fixed = "X1", m.lim = c(1, 3)), eval)

wts <- stackingWeights(models, data = Cement, R = 10)

ma <- model.avg(models)
Weights(ma) <- wts["mean", ]

predict(ma)




