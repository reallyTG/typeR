## ---- echo = FALSE, results = 'hide', message = FALSE--------------------
library(Tcomp)
library(knitr)
opts_chunk$set(comment=NA, fig.width=7, fig.height=4)
options(verbose = FALSE, xtable.type = "html")

## ------------------------------------------------------------------------
length(tourism)
class(tourism)

## ------------------------------------------------------------------------
tourism$Y5

## ------------------------------------------------------------------------
str(tourism$Y5)

## ------------------------------------------------------------------------
par(bty = "l")
plot(tourism$M11); grid()


## ----results = 'asis'----------------------------------------------------
library(dplyr, warn.conflicts = FALSE)
library(xtable)
lengthsm <- sapply(subset(tourism, "monthly"), function(s){length(s$x) + length(s$xx)})
lengthsq <- sapply(subset(tourism, "quarterly"), function(s){length(s$x) + length(s$xx)})
lengthsy <- sapply(subset(tourism, "yearly"), function(s){length(s$x) + length(s$xx)})

tmp <- data.frame(series_length = c(lengthsm, lengthsq, lengthsy),
                          series_type = c(rep("Monthly", length(lengthsm)),
                                          rep("Quarterly", length(lengthsq)),
                                          rep("Yearly", length(lengthsy))
                          )) %>%
  group_by(series_type) %>%
  summarise(
    TotalNumber = length(series_length),
    MeanLength = round(mean(series_length), 1),
    MedianLength = median(series_length),
    MinLength = min(series_length),
    MaxLength = max(series_length)
  ) %>%
  select(-series_type) %>%
  t() %>%
  as.matrix()
colnames(tmp) <- c("Monthly", "Quarterly", "Yearly")
xtable(tmp, digits = 1)

## ---- \\-----------------------------------------------------------------
forecast_comp(tourism[[300]], tests = list(6, 12, 24))

## ---- fig.height = 8-----------------------------------------------------
forecast_comp(tourism[[1000]], tests = list(1,2,3,4), plot = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  library(Tcomp)
#  library(dplyr)
#  library(tidyr)
#  library(parallel)
#  
#  # this function runs the four standard models in forecast_comp
#  # on a large chunk of the competition series from either Mcomp or Tcomp.
#  # The aim is to help comparisons with Athanasopoulos et al.
#  #
#  # The use of makePSOCKcluster and parLapply speeds up the analysis nearly four fold on my laptop
#  # eg running the test on all the yearly tourism series takes 12 seconds rather than 44 seconds.
#  
#  #' @param dataobj a list of class Mcomp such as M3 or tourism
#  #' @param cond1 a condition for subsetting dataobj eg "yearly"
#  #' @param tests a list of different horizons at which to return the MASE for four different models
#  #'
#  #' @return a data.frame with \code{length(tests) + 2} columns and 8 rows
#  accuracy_measures <- function(dataobj, cond1, tests){
#    cores <- detectCores()
#  
#    cluster <- makePSOCKcluster(max(1, cores - 1))
#  
#    clusterEvalQ(cluster, {
#      library(Tcomp)
#      library(forecast)
#    })
#  
#    results <- parLapply(cluster,
#                         subset(dataobj, cond1),
#                         forecast_comp,
#                         tests = tests)
#  
#    results_mat <- do.call(rbind, results)
#    nr <- nrow(results_mat)
#  
#    tmp <- as.data.frame(results_mat) %>%
#      mutate(measure = rep(rep(c("MAPE", "MASE"), times = c(4, 4)), times = nr / 8)) %>%
#      mutate(method = rownames(results_mat)) %>%
#      gather(horizon, mase, -method, -measure) %>%
#      group_by(method, measure, horizon) %>%
#      summarise(result = round(mean(mase), 2)) %>%
#      ungroup() %>%
#      mutate(horizon = factor(horizon, levels = colnames(results[[1]]))) %>%
#      spread(horizon, result) %>%
#      arrange(measure) %>%
#      as.data.frame()
#  
#    stopCluster(cluster)
#  
#    return(tmp)
#  }
#  
#  accuracy_measures(tourism, "monthly", list(1, 2, 3, 6, 12, 18, 24, 1:3, 1:12, 1:24))
#  accuracy_measures(tourism, "quarterly", list(1, 2, 3, 4, 6, 8, 1:4, 1:8))
#  accuracy_measures(tourism, "yearly", list(1, 2, 3, 4, 1:2, 1:4))
#  
#  

## ----results = 'asis'----------------------------------------------------
xtable(Tcomp_reproduction$monthly)
xtable(Tcomp_reproduction$quarterly)
xtable(Tcomp_reproduction$yearly)

