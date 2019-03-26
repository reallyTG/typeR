## ----load_data-----------------------------------------------------------
data(mtcars)
head(mtcars)

## ----linear_mod----------------------------------------------------------
lm_mod <- lm(mpg ~ ., data = mtcars)
summary(lm_mod)

## ----get_naive_error-----------------------------------------------------
err <- mean(resid(lm_mod)^2)

## ----define_fun_cv_lm----------------------------------------------------
cv_lm <- function(fold, data, reg_form) {
  # get name and index of outcome variable from regression formula
  out_var <- as.character(unlist(str_split(reg_form, " "))[1])
  out_var_ind <- as.numeric(which(colnames(data) == out_var))

  # split up data into training and validation sets
  train_data <- training(data)
  valid_data <- validation(data)

  # fit linear model on training set and predict on validation set
  mod <- lm(as.formula(reg_form), data = train_data)
  preds <- predict(mod, newdata = valid_data)

  # capture results to be returned as output
  out <- list(coef = data.frame(t(coef(mod))),
              SE = ((preds - valid_data[, out_var_ind])^2))
  return(out)
}

## ----load_pkgs-----------------------------------------------------------
library(origami)
library(stringr) # used in defining the cv_lm function above

## ----cv_lm_resub---------------------------------------------------------
# resubstitution estimate
resub <- make_folds(mtcars, fold_fun = folds_resubstitution)[[1]]
resub_results <- cv_lm(fold = resub, data = mtcars, reg_form = "mpg ~ .")
mean(resub_results$SE)

## ----cv_lm_cross_valdate-------------------------------------------------
# cross-validated estimate
folds <- make_folds(mtcars)
cvlm_results <- cross_validate(cv_fun = cv_lm, folds = folds, data = mtcars,
                               reg_form = "mpg ~ .")
mean(cvlm_results$SE)

## ----cv_fun_randomForest-------------------------------------------------
cv_rf <- function(fold, data, reg_form) {
  # get name and index of outcome variable from regression formula
  out_var <- as.character(unlist(str_split(reg_form, " "))[1])
  out_var_ind <- as.numeric(which(colnames(data) == out_var))

  # define training and validation sets based on input object of class "folds"
  train_data <- training(data)
  valid_data <- validation(data)

  # fit Random Forest regression on training set and predict on holdout set
  mod <- randomForest(formula = as.formula(reg_form), data = train_data)
  preds <- predict(mod, newdata = valid_data)

  # define output object to be returned as list (for flexibility)
  out <- list(coef = data.frame(mod$coefs),
              SE = ((preds - valid_data[, out_var_ind])^2))
  return(out)
}

## ------------------------------------------------------------------------
library(randomForest)
folds <- make_folds(mtcars)
cvrf_results <- cross_validate(cv_fun = cv_rf, folds = folds, data = mtcars,
                               reg_form = "mpg ~ .")
mean(cvrf_results$SE)

## ------------------------------------------------------------------------
data(AirPassengers)
print(AirPassengers)

## ------------------------------------------------------------------------
library(forecast)
folds = make_folds(AirPassengers, fold_fun=folds_rolling_origin,
                   first_window = 36, validation_size = 24)
fold = folds[[1]]

# function to calculate cross-validated squared error
cv_forecasts <- function(fold, data) {
  train_data <- training(data)
  valid_data <- validation(data)
  valid_size <- length(valid_data)

  train_ts <- ts(log10(train_data), frequency = 12)

  # borrowed from AirPassengers help
  arima_fit <- arima(train_ts, c(0, 1, 1),
                     seasonal = list(order = c(0, 1, 1),
                                     period = 12))
  raw_arima_pred <- predict(arima_fit, n.ahead = valid_size)
  arima_pred <- 10^raw_arima_pred$pred
  arima_MSE <- mean((arima_pred - valid_data)^2)

  # stl model
  stl_fit <- stlm(train_ts, s.window = 12)
  raw_stl_pred = forecast(stl_fit, h = valid_size)
  stl_pred <- 10^raw_stl_pred$mean
  stl_MSE <- mean((stl_pred - valid_data)^2)

  out <- list(mse = data.frame(fold = fold_index(),
                               arima = arima_MSE, stl = stl_MSE))
  return(out)
}

mses = cross_validate(cv_fun = cv_forecasts, folds = folds,
                      data = AirPassengers)$mse
colMeans(mses[, c("arima", "stl")])

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

