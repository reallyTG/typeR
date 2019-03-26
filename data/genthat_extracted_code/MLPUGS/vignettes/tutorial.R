## ----example, eval = FALSE-----------------------------------------------
#  ecc(x, y) %>% predict(newdata) %>% [summary|validate]

## ----setup---------------------------------------------------------------
library(MLPUGS)
data("movies")

## ----data_head, eval = FALSE---------------------------------------------
#  head(movies)

## ----formatted_data_head, echo = FALSE-----------------------------------
knitr::kable(head(movies))

## ----load_datasets-------------------------------------------------------
data("movies_train"); data("movies_test")

## ----train, eval = FALSE-------------------------------------------------
#  fit <- ecc(movies_train[, -(1:3)], movies_train[1:3], 3, randomForest::randomForest,
#             replace = TRUE)

## ----predict_rf, eval = FALSE--------------------------------------------
#  pugs <- predict(fit, movies_test[, -(1:3)], burn.in = 500, n.iters = 1500, thin = 15,
#                  .f = randomForest:::predict.randomForest, type = "prob")

## ----gather_prob, eval = FALSE-------------------------------------------
#  y_pred <- summary(pugs, type = "prob")

## ----compare_prob, echo = FALSE, eval = FALSE----------------------------
#  rownames(y_pred) <- rownames(movies_test)
#  knitr::kable(head(y_pred, 5), digits = 3)

## ----gather_class, eval = FALSE------------------------------------------
#  y_pred <- summary(pugs, type = "class")

## ----compare_class, echo = FALSE, eval = FALSE---------------------------
#  rownames(y_pred) <- rownames(movies_test)
#  knitr::kable(head(y_pred, 5), digits = 3)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(movies_test[1:5, 1:3],
             caption="**Table 4**: True classifications for the first 5 movies in the test (validation) set.")

## ----eval=FALSE----------------------------------------------------------
#  validate(pugs, movies_test[, 1:3])

## ----eval=FALSE,echo=FALSE-----------------------------------------------
#  temp <- as.data.frame(t(validate(pugs, movies_test[, 1:3])))
#  colnames(temp) <- "Measurement"
#  temp <- cbind(temp, Description = c(
#    "provides a steep penalty for predictions that are both confident and wrong",
#    "average per-obs exact classification",
#    "average per-obs classification with partial matches",
#    "per-label classification with partial matches",
#    "average per-example per-class total error"))
#  knitr::kable(temp, digits = 4)

