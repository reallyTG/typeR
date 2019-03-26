library(MatchLinReg)


### Name: mlr.match
### Title: Thin wrapper around 'Match' function from 'Matching' package
### Aliases: mlr.match

### ** Examples


data(lalonde)

tr <- lalonde$treat
Z.i <- as.matrix(lalonde[, c("age", "educ", "black"
  , "hispan", "married", "nodegree", "re74", "re75")])
Z.o <- model.matrix(~ I(age^2) + I(educ^2) + I(re74^2) + I(re75^2) - 1, lalonde)

# propensity score matching on all covariates
idx <- mlr.match(tr = tr, X = cbind(Z.i, Z.o), caliper = 1.0, replace = FALSE)

# improvement in maximum single-covariate bias due to matching
bias.obj.before <- mlr.bias(tr = tr, Z.i = Z.i, Z.o = Z.o)
bias.before <- bias.obj.before$subspace$bias
dir <- bias.obj.before$subspace$dir
bias.after <- as.numeric(mlr.bias(tr = tr[idx]
  , Z.i = Z.i[idx, ], Z.o = dir[idx], gamma.o = 1.0)$single$bias)

# percentage bias-squared rediction
cat("normalized bias - before:", bias.before, "\n")
cat("normalized bias - after:", bias.after, "\n")
cat("percentage squared-bias reduction:"
  , (bias.before^2 - bias.after^2)/bias.before^2, "\n")

# matching with replacement
idx.wr <- mlr.match(tr = tr, X = cbind(Z.i, Z.o), caliper = 1.0
  , replace = TRUE)
bias.after.wr <- as.numeric(mlr.bias(tr = tr
  , Z.i = Z.i, Z.o = dir, gamma.o = 1.0, idx = idx.wr)$single$bias)
cat("normalized bias - after (with replacement):", bias.after.wr, "\n")




