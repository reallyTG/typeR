library(SuperLearner)


### Name: SL.ksvm
### Title: Wrapper for Kernlab's SVM algorithm
### Aliases: SL.ksvm

### ** Examples


data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

sl = SuperLearner(Y, X, family = gaussian(),
                 SL.library = c("SL.mean", "SL.ksvm"))
sl

pred = predict(sl, X)
summary(pred$pred)




