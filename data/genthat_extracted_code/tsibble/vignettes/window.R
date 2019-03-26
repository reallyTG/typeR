## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(tibble.print_min = 5)

## ----full-data, message = FALSE------------------------------------------
library(tsibble)
library(dplyr)
pedestrian_full <- pedestrian %>% 
  fill_gaps(.full = TRUE)
pedestrian_full

## ----daily-mv------------------------------------------------------------
pedestrian_full %>% 
  group_by(Sensor) %>% 
  mutate(Daily_MA = slide_dbl(Count, 
    mean, na.rm = TRUE, .size = 24, .align = "center-left"
  ))

## ----monthly-mv-pre------------------------------------------------------
pedestrian_mth <- pedestrian_full %>% 
  mutate(YrMth = yearmonth(Date_Time)) %>% 
  nest(-Sensor, -YrMth)
pedestrian_mth

## ----monthly-mv----------------------------------------------------------
pedestrian_mth %>% 
  group_by(Sensor) %>% 
  # (1)
  # mutate(Monthly_MA = slide_dbl(data, 
  #   ~ mean(bind_rows(.)$Count, na.rm = TRUE), .size = 3, .align = "center"
  # ))
  # (2) equivalent to (1)
  mutate(Monthly_MA = slide_dbl(data, 
    ~ mean(.$Count, na.rm = TRUE), .size = 3, .align = "center", .bind = TRUE
  ))

## ----lm------------------------------------------------------------------
my_diag <- function(...) {
  data <- tibble(...)
  fit <- lm(Count ~ Time, data = data)
  list(fitted = fitted(fit), resid = residuals(fit))
}
pedestrian %>%
  filter_index(~ "2015-03") %>%
  nest(-Sensor) %>%
  mutate(diag = purrr::map(data, ~ pslide_dfr(., my_diag, .size = 24 * 7)))

## ----furrr, eval = FALSE-------------------------------------------------
#  library(furrr)
#  plan(multiprocess)
#  pedestrian %>%
#    filter_index(~ "2015-03") %>%
#    nest(-Sensor) %>%
#    mutate(diag = future_map(data, ~ future_pslide_dfr(., my_diag, .size = 24 * 7)))

