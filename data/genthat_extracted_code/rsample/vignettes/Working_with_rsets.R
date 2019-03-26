## ----ex_setup, include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  digits = 3,
  collapse = TRUE,
  comment = "#>"
  )
options(digits = 3, width = 90)
library(ggplot2)
theme_set(theme_bw())

## ----attrition, message=FALSE-----------------------------------------------------------
library(rsample)
data("attrition")
names(attrition)
table(attrition$Attrition)

## ----form, message=FALSE----------------------------------------------------------------
mod_form <- as.formula(Attrition ~ JobSatisfaction + Gender + MonthlyIncome)

## ----model_vfold, message=FALSE---------------------------------------------------------
library(rsample)
set.seed(4622)
rs_obj <- vfold_cv(attrition, v = 10, repeats = 10)
rs_obj

## ----lm_func----------------------------------------------------------------------------
## splits will be the `rsplit` object with the 90/10 partition
holdout_results <- function(splits, ...) {
  # Fit the model to the 90%
  mod <- glm(..., data = analysis(splits), family = binomial)
  # Save the 10%
  holdout <- assessment(splits)
  # `augment` will save the predictions with the holdout data set
  res <- broom::augment(mod, newdata = holdout)
  # Class predictions on the assessment set from class probs
  lvls <- levels(holdout$Attrition)
  predictions <- factor(ifelse(res$.fitted > 0, lvls[2], lvls[1]),
                        levels = lvls)
  # Calculate whether the prediction was correct
  res$correct <- predictions == holdout$Attrition
  # Return the assessment data set with the additional columns
  res
}

## ----onefold, warning = FALSE-----------------------------------------------------------
example <- holdout_results(rs_obj$splits[[1]],  mod_form)
dim(example)
dim(assessment(rs_obj$splits[[1]]))
## newly added columns:
example[1:10, setdiff(names(example), names(attrition))]

## ----model_purrr, warning=FALSE---------------------------------------------------------
library(purrr)
rs_obj$results <- map(rs_obj$splits,
                      holdout_results,
                      mod_form)
rs_obj

## ----model_acc--------------------------------------------------------------------------
rs_obj$accuracy <- map_dbl(rs_obj$results, function(x) mean(x$correct))
summary(rs_obj$accuracy)

## ----type_plot--------------------------------------------------------------------------
ggplot(attrition, aes(x = Gender, y = MonthlyIncome)) + 
  geom_boxplot() + 
  scale_y_log10()

## ----mean_diff--------------------------------------------------------------------------
median_diff <- function(splits) {
  x <- analysis(splits)
  median(x$MonthlyIncome[x$Gender == "Female"]) - 
      median(x$MonthlyIncome[x$Gender == "Male"])     
}

## ----boot_mean_diff---------------------------------------------------------------------
set.seed(353)
bt_resamples <- bootstraps(attrition, times = 500)

## ----stats------------------------------------------------------------------------------
bt_resamples$wage_diff <- map_dbl(bt_resamples$splits, median_diff)

## ----stats_plot-------------------------------------------------------------------------
ggplot(bt_resamples, aes(x = wage_diff)) + 
  geom_line(stat = "density", adjust = 1.25) + 
  xlab("Difference in Median Monthly Income (Female - Male)")

## ----ci---------------------------------------------------------------------------------
quantile(bt_resamples$wage_diff, 
         probs = c(0.025, 0.500, 0.975))

## ----coefs------------------------------------------------------------------------------
glm_coefs <- function(splits, ...) {
  ## use `analysis` or `as.data.frame` to get the analysis data
  mod <- glm(..., data = analysis(splits), family = binomial)
  as.data.frame(t(coef(mod)))
}
bt_resamples$betas <- map(.x = bt_resamples$splits, 
                          .f = glm_coefs, 
                          mod_form)
bt_resamples
bt_resamples$betas[[1]]

## ----tidy_rsplit------------------------------------------------------------------------
first_resample <- bt_resamples$splits[[1]]
class(first_resample)
tidy(first_resample)

## ----tidy_rset--------------------------------------------------------------------------
class(bt_resamples)
tidy(bt_resamples)

