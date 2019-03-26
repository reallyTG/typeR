library(ck37r)


### Name: cvsl_weights
### Title: Create a table of meta-weights from a CV.SuperLearner
### Aliases: cvsl_weights

### ** Examples

library(SuperLearner)
library(ck37r)

data(Boston, package = "MASS")

set.seed(1, "L'Ecuyer-CMRG")

# Subset rows to speed up example computation.
row_subset = sample(nrow(Boston), 100)

Boston = Boston[row_subset, ]
X = subset(Boston, select = -chas)

cvsl = CV.SuperLearner(Boston$chas, X[, 1:2], family = binomial(),
                      cvControl = list(V = 2, stratifyCV = TRUE),
                      SL.library = c("SL.mean", "SL.glm"))
cvsl_weights(cvsl)




