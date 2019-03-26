## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  collapse = TRUE,
  fig.width = 6, 
  fig.height = 4
)

## ----install, eval=FALSE-------------------------------------------------
#  library(devtools)
#  install_github("expersso/BIS") # Github
#  install.packages("BIS")        # CRAN

## ----datasets------------------------------------------------------------
library(BIS)

datasets <- get_datasets()
head(datasets, 20)

## ----rates---------------------------------------------------------------
rates <- get_bis(datasets$url[datasets$name == "Policy rates (monthly)"], quiet = TRUE)
head(rates)

## ----plot----------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(zoo)

rates_plot <- rates %>%
  mutate(date = as.Date(as.yearmon(date))) %>%
  filter(grepl("^(XM|US|CH|JP|GB|CA)", ref_area))

ggplot(rates_plot, aes(date, obs_value, color = reference_area)) +
  geom_hline(yintercept = 0, linetype = "dashed",
             color = "grey70", size = 0.02) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~reference_area) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = NULL, y = NULL,
       title = "Central bank policy rates",
       subtitle = "% per annum")

