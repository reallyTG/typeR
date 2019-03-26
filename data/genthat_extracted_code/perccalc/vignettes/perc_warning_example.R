## ---- warning = FALSE, message = FALSE-----------------------------------
library(perccalc)
library(dplyr)
library(ggplot2)

## ---- message = FALSE, warning = FALSE-----------------------------------

smoking_data <-
  MASS::survey %>% # you will need to install the MASS package
  as_tibble() %>%
  select(Sex, Smoke, Pulse) %>%
  rename(
    gender = Sex,
    smoke = Smoke,
    pulse_rate = Pulse
  )

## ---- echo = FALSE-------------------------------------------------------
smoking_data %>%
  arrange(pulse_rate)

## ------------------------------------------------------------------------
smoking_data <-
  smoking_data %>%
  mutate(smoke = factor(smoke,
                        levels = c("Never", "Occas", "Regul", "Heavy"),
                        ordered = TRUE))

perc_diff(smoking_data, smoke, pulse_rate)

## ------------------------------------------------------------------------
perc_dist(smoking_data, smoke, pulse_rate) %>%
  head()

