## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(probably)

## ------------------------------------------------------------------------
x <- factor(c("Yes", "No", "Yes", "Yes"))

# Create a class_pred object from a factor
class_pred(x)

# Say you aren't sure about that 2nd "Yes" value. 
# You could mark it as equivocal.
class_pred(x, which = 3)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)
data("segment_logistic")
segment_logistic

# Convert probabilities into predictions
# > 0.5 = good
# < 0.5 = poor
segment_logistic_thresh <- segment_logistic %>%
  mutate(
    .pred = make_two_class_pred(
      estimate = .pred_good, 
      levels = levels(Class), 
      threshold = 0.5
    )
  )

segment_logistic_thresh

## ------------------------------------------------------------------------
# Convert probabilities into predictions
#        x > 0.55 = good
#        x < 0.45 = poor
# 0.45 < x < 0.55 = equivocal
segment_pred <- segment_logistic %>%
  mutate(
    .pred = make_two_class_pred(
      estimate = .pred_good, 
      levels = levels(Class), 
      threshold = 0.5,
      buffer = 0.05
    )
  ) 

segment_pred %>%
  count(.pred)

segment_pred %>%
  summarise(reportable = reportable_rate(.pred))

## ------------------------------------------------------------------------
segment_pred %>%
  mutate(.pred_fct = as.factor(.pred)) %>%
  count(.pred, .pred_fct)

levels(segment_pred$.pred)

## ------------------------------------------------------------------------
library(yardstick)

# No equivocal zone
segment_logistic_thresh %>%
  mutate(.pred_fct = as.factor(.pred)) %>%
  precision(Class, .pred_fct)

# Equivocal zone
segment_pred %>%
  mutate(.pred_fct = as.factor(.pred)) %>%
  precision(Class, .pred_fct)

