library(SuperLearner)


### Name: SL.biglasso
### Title: SL wrapper for biglasso
### Aliases: SL.biglasso

### ** Examples


data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

# Sample rows to speed up example.
row_subset = sample(nrow(X), 30)

# Subset rows and columns & use only 2 folds to speed up example.
sl = SuperLearner(Y[row_subset], X[row_subset, 1:2, drop = FALSE],
                  family = gaussian(), cvControl = list(V = 2),
                  SL.library = "SL.biglasso")
sl

pred = predict(sl, X)
summary(pred$pred)




