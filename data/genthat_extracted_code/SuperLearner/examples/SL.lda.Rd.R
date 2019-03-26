library(SuperLearner)


### Name: SL.lda
### Title: SL wrapper for MASS:lda
### Aliases: SL.lda

### ** Examples


data(Boston, package = "MASS")
Y = as.numeric(Boston$medv > 23)
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

# Use only 2 CV folds to speed up example.
sl = SuperLearner(Y, X, family = binomial(), cvControl = list(V = 2),
                 SL.library = c("SL.mean", "SL.lda"))
sl

pred = predict(sl, X)
summary(pred$pred)




