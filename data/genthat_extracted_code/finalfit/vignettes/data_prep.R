## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
	collapse = TRUE,
	comment = "#>"
)

## ------------------------------------------------------------------------
library(readr)

# Save example
write_csv(boot::melanoma, "boot.csv")

# Read data
melanoma = read_csv("boot.csv")

## ------------------------------------------------------------------------
library(finalfit)
ff_glimpse(melanoma)

## ------------------------------------------------------------------------
missing_glimpse(melanoma)

## ------------------------------------------------------------------------
library(dplyr)
melanoma %>% 
  mutate(
    status.factor = factor(status, levels = c(1, 2, 3), 
      labels = c("Died from melanoma", "Alive", "Died from other causes")) %>% 
    ff_label("Status"),
    sex.factor = factor(sex, levels = c(1, 0),
      labels = c("Male", "Female")) %>% 
    ff_label("Sex"),
    ulcer.factor = factor(ulcer, levels = c(1, 0),
      labels = c("Present", "Absent")) %>% 
    ff_label("Ulcer")
  ) -> melanoma

ff_glimpse(melanoma)

