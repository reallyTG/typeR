library(SuperLearner)


### Name: SL.ranger
### Title: SL wrapper for ranger
### Aliases: SL.ranger

### ** Examples


data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

# Use only 2 CV folds to speed up example.
sl = SuperLearner(Y, X, family = gaussian(), cvControl = list(V = 2),
                 SL.library = c("SL.mean", "SL.ranger"))
sl

pred = predict(sl, X)
summary(pred$pred)




