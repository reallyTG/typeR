## ------------------------------------------------------------------------
glmmPQL_modelfun <- function(formula = NULL, data = NULL, random = NULL,
                             family = NULL) {
  fit <- glmmPQL(fixed = formula, data = data, random = random, family = family)
  return(fit)
}

## ---- eval = FALSE-------------------------------------------------------
#  rf_predfun <- function(object = NULL, newdata = NULL, type = NULL) {
#    pred <- predict(object = object, newdata = newdata, type = type)
#    pred <- pred[, 2]
#  }

## ------------------------------------------------------------------------
svm_predfun <- function(object = NULL, newdata = NULL, probability = NULL) {
  pred <- predict(object, newdata = newdata, probability = TRUE)
  pred <- attr(pred, "probabilities")[, 2]
}

