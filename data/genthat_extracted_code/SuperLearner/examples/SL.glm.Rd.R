library(SuperLearner)


### Name: SL.glm
### Title: Wrapper for glm
### Aliases: SL.glm

### ** Examples


data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

sl = SuperLearner(Y, X, family = gaussian(),
                  SL.library = c("SL.mean", "SL.glm"))

print(sl)




