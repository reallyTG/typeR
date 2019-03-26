library(SuperLearner)


### Name: SL.dbarts
### Title: Discrete bayesian additive regression tree sampler
### Aliases: SL.dbarts

### ** Examples


data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

# Sample rows to speed up example.
row_subset = sample(nrow(X), 30)

sl = SuperLearner(Y[row_subset], X[row_subset, ], family = gaussian(),
cvControl = list(V = 2), SL.library = c("SL.mean", "SL.dbarts"))

print(sl)




