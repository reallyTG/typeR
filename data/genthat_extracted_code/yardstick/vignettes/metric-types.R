## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- warning = FALSE, message = FALSE-----------------------------------
library(yardstick)
library(dplyr)
data("hpc_cv")

hpc_cv %>%
  group_by(Resample) %>%
  slice(1:3)

## ------------------------------------------------------------------------
hpc_cv %>%
  filter(Resample == "Fold01") %>%
  accuracy(obs, pred)


## ------------------------------------------------------------------------
hpc_cv %>%
  group_by(Resample) %>%
  accuracy(obs, pred)

## ------------------------------------------------------------------------
class_metrics <- metric_set(accuracy, kap)

hpc_cv %>%
  group_by(Resample) %>%
  class_metrics(obs, estimate = pred)

## ---- echo=FALSE, warning=FALSE, message=FALSE, results='asis'-----------
library(kableExtra)
library(knitr)
library(dplyr)

yardns <- asNamespace("yardstick")
fns <- lapply(names(yardns), get, envir = yardns)
names(fns) <- names(yardns)

get_metrics <- function(fns, type) {
  where <- vapply(fns, inherits, what = type, FUN.VALUE = logical(1))
  paste0("`", sort(names(fns[where])), "()`")
}

all_metrics <- bind_rows(
  tibble(type = "class", metric = get_metrics(fns, "class_metric")),
  tibble(type = "class prob", metric = get_metrics(fns, "prob_metric")),
  tibble(type = "numeric", metric = get_metrics(fns, "numeric_metric"))
)

all_metrics %>%
  knitr::kable(format = "html") %>%
  kable_styling(full_width = FALSE) %>%
  collapse_rows(columns = 1)

