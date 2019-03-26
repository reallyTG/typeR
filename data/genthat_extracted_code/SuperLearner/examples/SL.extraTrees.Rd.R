library(SuperLearner)


### Name: SL.extraTrees
### Title: extraTrees SuperLearner wrapper
### Aliases: SL.extraTrees

### ** Examples


data(Boston, package = "MASS")
Y = Boston$medv
# Remove outcome from covariate dataframe.
X = Boston[, -14]

set.seed(1)

# Sample rows to speed up example.
row_subset = sample(nrow(X), 30)

sl = SuperLearner(Y[row_subset], X[row_subset, ], family = gaussian(),
cvControl = list(V = 2), SL.library = c("SL.mean", "SL.extraTrees"))

print(sl)




