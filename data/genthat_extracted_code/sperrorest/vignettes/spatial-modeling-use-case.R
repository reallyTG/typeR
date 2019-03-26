## ---- echo=FALSE, cache=FALSE, results='hide'----------------------------
library(knitr)
opts_chunk$set(cache = FALSE,
               eval = FALSE, 
               fig.align = "center",
               collapse = TRUE,
               fig.width = 4,
               fig.height = 5)
opts_knit$set(width = 125)
options(digits = 3)

## ---- message=FALSE------------------------------------------------------
#  library(pacman)
#  p_load(sperrorest)

## ------------------------------------------------------------------------
#  data("maipo", package = "sperrorest")

## ------------------------------------------------------------------------
#  predictors <- colnames(maipo)[5:ncol(maipo)]
#  # Construct a formula:
#  fo <- as.formula(paste("croptype ~", paste(predictors, collapse = "+")))

## ------------------------------------------------------------------------
#  p_load(MASS)
#  fit <- lda(fo, data = maipo)

## ------------------------------------------------------------------------
#  pred <- predict(fit, newdata = maipo)$class
#  mean(pred != maipo$croptype)

## ------------------------------------------------------------------------
#  table(pred = pred, obs = maipo$croptype)

## ---- message=FALSE------------------------------------------------------
#  p_load(rpart)

## ------------------------------------------------------------------------
#  fit <- rpart(fo, data = maipo)
#  
#  ## optional: view the classiciation tree
#  # par(xpd = TRUE)
#  # plot(fit)
#  # text(fit, use.n = TRUE)

## ------------------------------------------------------------------------
#  pred <- predict(fit, newdata = maipo, type = "class")
#  mean(pred != maipo$croptype)

## ------------------------------------------------------------------------
#  table(pred = pred, obs = maipo$croptype)

## ---- message=FALSE------------------------------------------------------
#  p_load(randomForest)

## ------------------------------------------------------------------------
#  fit <- randomForest(fo, data = maipo, coob = TRUE)
#  fit

## ------------------------------------------------------------------------
#  pred <- predict(fit, newdata = maipo, type = "class")
#  mean(pred != maipo$croptype)

## ------------------------------------------------------------------------
#  table(pred = pred, obs = maipo$croptype)

## ------------------------------------------------------------------------
#  lda_predfun <- function(object, newdata, fac = NULL) {
#  
#    p_load(nnet)
#    majority <- function(x) {
#      levels(x)[which.is.max(table(x))]
#    }
#  
#    majority_filter <- function(x, fac) {
#      for (lev in levels(fac)) {
#        x[fac == lev] <- majority(x[fac == lev])
#      }
#      x
#    }
#  
#    pred <- predict(object, newdata = newdata)$class
#    if (!is.null(fac)) pred <- majority_filter(pred, newdata[, fac])
#    return(pred)
#  }

## ------------------------------------------------------------------------
#  res_lda_nsp <- sperrorest(fo, data = maipo, coords = c("utmx","utmy"),
#                            model_fun = lda,
#                            pred_fun = lda_predfun,
#                            pred_args = list(fac = "field"),
#                            smp_fun = partition_cv,
#                            smp_args = list(repetition = 1:100, nfold = 5),
#                            error_rep = TRUE, error_fold = TRUE,
#                            progress = FALSE)

## ------------------------------------------------------------------------
#  summary(res_lda_nsp$error_rep)

## ---- echo = FALSE-------------------------------------------------------
#  png(filename = "../inst/figure/resamp-plot.png", width = 7, height = 3, units = "in", res = 90)
#  resamp <- partition_factor_cv(maipo, nfold = 5, repetition = 1:1, fac = "field")
#  plot(resamp, maipo, coords = c("utmx","utmy"))
#  dev.off()

## ------------------------------------------------------------------------
#  resamp <- partition_factor_cv(maipo, nfold = 5, repetition = 1:1, fac = "field")
#  plot(resamp, maipo, coords = c("utmx","utmy"))

## ----sperro-lda----------------------------------------------------------
#  res_lda_sp <- sperrorest(fo, data = maipo, coords = c("utmx","utmy"),
#                           model_fun = lda,
#                           pred_fun = lda_predfun,
#                           pred_args = list(fac = "field"),
#                           smp_fun = partition_factor_cv,
#                           smp_args = list(fac = "field", repetition = 1:50, nfold = 5),
#                           error_rep = TRUE, error_fold = TRUE,
#                           benchmark = TRUE, progress = FALSE)
#  res_lda_sp$benchmark$runtime_performance

## ------------------------------------------------------------------------
#  summary(res_lda_sp$error_rep)

## ----def-rf-predfun------------------------------------------------------
#  rf_predfun <- function(object, newdata, fac = NULL) {
#  
#    p_load(nnet)
#    majority <- function(x) {
#      levels(x)[which.is.max(table(x))]
#    }
#  
#    majority_filter <- function(x, fac) {
#      for (lev in levels(fac)) {
#        x[fac == lev] <- majority(x[fac == lev])
#      }
#      x
#    }
#  
#    pred <- predict(object, newdata = newdata)
#    if (!is.null(fac)) pred <- majority_filter(pred, newdata[,fac])
#    return(pred)
#  }

## ----sperro-rf-----------------------------------------------------------
#  res_rf_sp <- sperrorest(fo, data = maipo, coords = c("utmx","utmy"),
#                          model_fun = randomForest,
#                          pred_fun = rf_predfun,
#                          pred_args = list(fac = "field"),
#                          smp_fun = partition_factor_cv,
#                          smp_args = list(fac = "field",
#                                          repetition = 1:50, nfold = 5),
#                          error_rep = TRUE, error_fold = TRUE,
#                          benchmark = TRUE, progress = 2)

## ------------------------------------------------------------------------
#  summary(res_rf_sp$error_rep$test_error)

## ------------------------------------------------------------------------
#  summary(res_rf_sp$error_rep$test_accuracy)

