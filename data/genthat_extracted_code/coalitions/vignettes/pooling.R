## ---- echo = FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
  fig.align  = "center",
  fig.width  = 4,
  fig.height = 4,
  warning    = FALSE,
  crop       = TRUE)

## ----message=FALSE, warning=FALSE----------------------------------------
library(tidyr)
library(purrr)
library(dplyr)
library(coalitions)

## ------------------------------------------------------------------------
# Scrape current surveys from the major polling agencies in Germany
# surveys <- get_surveys()
# As the web connection is sometimes a bit unstable we here use the sample data set of pre-scraped surveys
surveys <- coalitions::surveys_sample
surveys

## ------------------------------------------------------------------------
# Obtain the pooled sample for today, based on the last 14 days
last_date <- surveys %>% tidyr::unnest() %>% pull(date) %>% max()
pool <- pool_surveys(surveys, last_date = last_date)
pool %>% select(-start, -end)

