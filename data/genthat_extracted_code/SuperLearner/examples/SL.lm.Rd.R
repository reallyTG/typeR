library(SuperLearner)


### Name: SL.lm
### Title: Wrapper for lm
### Aliases: SL.lm

### ** Examples


data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

sl = SuperLearner(Y, X, family = gaussian(),
                  SL.library = c("SL.mean", "SL.lm"))

print(sl)




