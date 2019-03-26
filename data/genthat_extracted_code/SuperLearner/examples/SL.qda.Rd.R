library(SuperLearner)


### Name: SL.qda
### Title: SL wrapper for MASS:qda
### Aliases: SL.qda

### ** Examples


data(Boston, package = "MASS")
Y = as.numeric(Boston$medv > 23)
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

# Use only 2 CV folds to speed up example.
sl = SuperLearner(Y, X, family = binomial(), cvControl = list(V = 2),
                 SL.library = c("SL.mean", "SL.qda"))
sl

pred = predict(sl, X)
summary(pred$pred)





