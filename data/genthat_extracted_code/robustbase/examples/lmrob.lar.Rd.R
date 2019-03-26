library(robustbase)


### Name: lmrob.lar
### Title: Least Absolute Residuals / L1 Regression
### Aliases: lmrob.lar
### Keywords: L1 regression

### ** Examples

data(stackloss)
X <- model.matrix(stack.loss ~ . , data = stackloss)
y <- stack.loss
(fm.L1 <- lmrob.lar(X, y))
with(fm.L1, stopifnot(converged
  , status == 1L
  , all.equal(scale, 1.5291576438)
  , sum(abs(residuals) < 1e-15) == 4 # p=4 exactly fitted obs.
))



