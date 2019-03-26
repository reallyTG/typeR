library(mlapi)


### Name: mlapiEstimation
### Title: Base abstract class for all classification/regression models
### Aliases: mlapiEstimation
### Keywords: datasets

### ** Examples

SimpleLinearModel = R6::R6Class(
classname = "mlapiSimpleLinearModel",
inherit = mlapi::mlapiEstimation,
public = list(
  initialize = function(tol = 1e-7) {
    private$tol = tol
    super$set_internal_matrix_formats(dense = "matrix", sparse = NULL)
  },
  fit = function(x, y, ...) {
    x = super$check_convert_input(x)
   stopifnot(is.vector(y))
   stopifnot(is.numeric(y))
   stopifnot(nrow(x) == length(y))

   private$n_features = ncol(x)
   private$coefficients = .lm.fit(x, y, tol = private$tol)[["coefficients"]]
 },
 predict = function(x) {
   stopifnot(ncol(x) == private$n_features)
   x %*% matrix(private$coefficients, ncol = 1)
 }
),
private = list(
  tol = NULL,
  coefficients = NULL,
  n_features = NULL
))
set.seed(1)
model = SimpleLinearModel$new()
x = matrix(sample(100 * 10, replace = TRUE), ncol = 10)
y = sample(c(0, 1), 100, replace = TRUE)
model$fit(as.data.frame(x), y)
res1 = model$predict(x)
# check pipe-compatible S3 interface
res2 = predict(x, model)
identical(res1, res2)



