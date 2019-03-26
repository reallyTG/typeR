library(mlapi)


### Name: mlapiDecomposition
### Title: Base abstract class for all decompositions
### Aliases: mlapiDecomposition mlapiDecomposition mlapiDecompositionOnline
### Keywords: datasets

### ** Examples

TruncatedSVD = R6::R6Class(
  classname = "TruncatedSVD",
  inherit = mlapi::mlapiDecomposition,
  public = list(
    initialize = function(rank = 10) {
      private$rank = rank
      super$set_internal_matrix_formats(dense = "matrix", sparse = NULL)
    },
    fit_transform = function(x, ...) {
      x = super$check_convert_input(x)
      private$n_features = ncol(x)
      svd_fit = svd(x, nu = private$rank, nv = private$rank, ...)
      sing_values = svd_fit$d[seq_len(private$rank)]
      result = svd_fit$u %*% diag(x = sqrt(sing_values))
      private$components_ = t(svd_fit$v %*% diag(x = sqrt(sing_values)))
      rm(svd_fit)
      rownames(result) = rownames(x)
      colnames(private$components_) = colnames(x)
      private$fitted = TRUE
      invisible(result)
    },
    transform = function(x, ...) {
      if (private$fitted) {
        stopifnot(ncol(x) == ncol(private$components_))
        lhs = tcrossprod(private$components_)
        rhs = as.matrix(tcrossprod(private$components_, x))
        t(solve(lhs, rhs))
      }
      else
        stop("Fit the model first woth model$fit_transform()!")
    }
  ),
  private = list(
    rank = NULL,
    n_features = NULL,
    fitted = NULL
  )
)
set.seed(1)
model = TruncatedSVD$new(2)
x = matrix(sample(100 * 10, replace = TRUE), ncol = 10)
x_trunc = model$fit_transform(x)
dim(x_trunc)

x_trunc_2 = model$transform(x)
sum(x_trunc_2 - x_trunc)

#' check pipe-compatible S3 interface
x_trunc_2_s3 = transform(x, model)
identical(x_trunc_2, x_trunc_2_s3)



