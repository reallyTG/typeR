## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE------------------------------------------------------
library(yardstick)

## ------------------------------------------------------------------------
mse_vec <- function(truth, estimate, na_rm = TRUE, ...) {
  
  mse_impl <- function(truth, estimate) {
    mean((truth - estimate) ^ 2)
  }
  
  metric_vec_template(
    metric_impl = mse_impl,
    truth = truth, 
    estimate = estimate,
    na_rm = na_rm,
    cls = "numeric",
    ...
  )
  
}

## ------------------------------------------------------------------------
data("solubility_test")

mse_vec(
  truth = solubility_test$solubility, 
  estimate = solubility_test$prediction
)

## ---- error = TRUE-------------------------------------------------------
mse_vec(truth = "apple", estimate = 1)

mse_vec(truth = 1, estimate = factor("xyz"))

## ------------------------------------------------------------------------
# NA values removed
mse_vec(truth = c(NA, .5, .4), estimate = c(1, .6, .5))

# NA returned
mse_vec(truth = c(NA, .5, .4), estimate = c(1, .6, .5), na_rm = FALSE)

## ------------------------------------------------------------------------
library(rlang)

mse <- function(data, ...) {
  UseMethod("mse")
}

mse.data.frame <- function(data, truth, estimate, na_rm = TRUE, ...) {
  
  metric_summarizer(
    metric_nm = "mse",
    metric_fn = mse_vec,
    data = data,
    truth = !! enquo(truth),
    estimate = !! enquo(estimate), 
    na_rm = na_rm,
    ...
  )
  
}

## ---- error = TRUE-------------------------------------------------------
mse(solubility_test, truth = solubility, estimate = prediction)

# Error handling
mse(solubility_test, truth = solubility, estimate = factor("xyz"))

## ---- message=FALSE------------------------------------------------------
library(dplyr)

set.seed(1234)
size <- 100
times <- 10

# create 10 resamples
solubility_resampled <- bind_rows(
  replicate(
    n = times,
    expr = sample_n(solubility_test, size, replace = TRUE),
    simplify = FALSE
  ),
  .id = "resample"
)

solubility_resampled %>%
  group_by(resample) %>%
  mse(solubility, prediction)

## ------------------------------------------------------------------------
# So we can support the yardstick event_first option
relevant_col <- function(xtab) {
  if (getOption("yardstick.event_first")) {
      colnames(xtab)[1]
    } else {
      colnames(xtab)[2]
    }
}

miss_rate_vec <- function(truth, estimate, estimator = NULL, na_rm = TRUE, ...) {
  
  estimator <- finalize_estimator(truth, estimator)
  
  miss_rate_impl <- function(truth, estimate) {
    
    # Create 
    xtab <- table(estimate, truth)
    col <- relevant_col(xtab)
    col2 <- setdiff(colnames(xtab), col)
    
    tp <- xtab[col, col]
    fn <- xtab[col2, col]
    
    fn / (fn + tp)
    
  }
  
  metric_vec_template(
    metric_impl = miss_rate_impl,
    truth = truth,
    estimate = estimate,
    na_rm = na_rm,
    cls = "factor",
    estimator = estimator,
    ...
  )
  
}

## ------------------------------------------------------------------------
data("two_class_example")
miss_rate_vec(two_class_example$truth, two_class_example$predicted)

## ------------------------------------------------------------------------
data("hpc_cv")
fold1 <- filter(hpc_cv, Resample == "Fold01")
miss_rate_vec(fold1$obs, fold1$pred)

## ---- error = TRUE-------------------------------------------------------
finalize_estimator_internal.miss_rate <- function(metric_dispatcher, x, estimator) {
  
  validate_estimator(estimator, estimator_override = "binary")
  if(!is.null(estimator)) {
    return(estimator)
  }
  
  lvls <- levels(x)
  if(length(lvls) > 2) {
    stop("A multiclass `truth` input was provided, but only `binary` is supported.")
  } 
  "binary"
}

miss_rate_vec <- function(truth, estimate, estimator = NULL, na_rm = TRUE, ...) {
  
  # calls finalize_estimator_internal() internally
  estimator <- finalize_estimator(truth, estimator, metric_class = "miss_rate")
  
  miss_rate_impl <- function(truth, estimate) {
    
    # Create 
    xtab <- table(estimate, truth)
    col <- relevant_col(xtab)
    col2 <- setdiff(colnames(xtab), col)
    
    tp <- xtab[col, col]
    fn <- xtab[col2, col]
    
    fn / (fn + tp)
    
  }
  
  metric_vec_template(
    metric_impl = miss_rate_impl,
    truth = truth,
    estimate = estimate,
    na_rm = na_rm,
    cls = "factor",
    estimator = estimator,
    ...
  )
  
}

# Error thrown by our custom handler
miss_rate_vec(fold1$obs, fold1$pred)

# Error thrown by validate_estimator()
miss_rate_vec(fold1$obs, fold1$pred, estimator = "macro")

## ------------------------------------------------------------------------
rm(finalize_estimator_internal.miss_rate)

## ------------------------------------------------------------------------
miss_rate_vec <- function(truth, estimate, estimator = NULL, na_rm = TRUE, ...) {
  
  # calls finalize_estimator_internal() internally
  estimator <- finalize_estimator(truth, estimator, metric_class = "miss_rate")
  
  miss_rate_impl <- function(truth, estimate) {
    xtab <- table(estimate, truth)
    # Rather than implement the actual method here, we rely on
    # an *_estimator_impl() function that can handle binary
    # and multiclass cases
    miss_rate_estimator_impl(xtab, estimator)
  }
  
  metric_vec_template(
    metric_impl = miss_rate_impl,
    truth = truth,
    estimate = estimate,
    na_rm = na_rm,
    cls = "factor",
    estimator = estimator,
    ...
  )
  
}

# This function switches between binary and multiclass implementations
miss_rate_estimator_impl <- function(data, estimator) {
  if(estimator == "binary") {
    miss_rate_binary(data)
  } else {
    # Encapsulates the macro, macro weighted, and micro cases
    wt <- get_weights(data, estimator)
    res <- miss_rate_multiclass(data, estimator)
    weighted.mean(res, wt)
  }
}

miss_rate_binary <- function(data) {
  col <- relevant_col(data)
  col2 <- setdiff(colnames(data), col)
  
  tp <- data[col, col]
  fn <- data[col2, col]
  
  fn / (fn + tp)
}

miss_rate_multiclass <- function(data, estimator) {
  
  # We need tp and fn for all classes individually
  # we can get this by taking advantage of the fact
  # that tp + fn = colSums(data)
  tp <- diag(data)
  tpfn <- colSums(data)
  fn <- tpfn - tp
  
  # If using a micro estimator, we sum the individual
  # pieces before performing the miss rate calculation
  if(estimator == "micro") {
    tp <- sum(tp)
    fn <- sum(fn)
  }
  
  # return the vector 
  tp / (tp + fn)
}

## ------------------------------------------------------------------------
# two class
miss_rate_vec(two_class_example$truth, two_class_example$predicted)

# multiclass
miss_rate_vec(fold1$obs, fold1$pred)

## ------------------------------------------------------------------------
miss_rate <- function(data, truth, estimate, estimator = NULL, na_rm = TRUE, ...) {
  UseMethod("miss_rate")
}

miss_rate.data.frame <- function(data, truth, estimate, estimator = NULL, na_rm = TRUE, ...) {
  
  metric_summarizer(
    metric_nm = "miss_rate",
    metric_fn = miss_rate_vec,
    data = data,
    truth = !! enquo(truth),
    estimate = !! enquo(estimate), 
    estimator = estimator,
    na_rm = na_rm,
    ...
  )
  
}

## ---- error = TRUE-------------------------------------------------------
# Macro weighted automatically selected
fold1 %>%
  miss_rate(obs, pred)

# Switch to micro
fold1 %>%
  miss_rate(obs, pred, estimator = "micro")

# Macro weighted by resample
hpc_cv %>%
  group_by(Resample) %>%
  miss_rate(obs, pred, estimator = "macro_weighted")

# Error handling
miss_rate(hpc_cv, obs, VF)

## ---- error=TRUE---------------------------------------------------------
# This errors because the class has not been set
metric_set(mse, rmse)

class(mse) <- c("numeric_metric", class(mse))

numeric_mets <- metric_set(mse, rmse)

numeric_mets(solubility_test, solubility, prediction)

