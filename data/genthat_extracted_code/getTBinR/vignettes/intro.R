## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>",
  fig.width = 7, fig.height = 7, 
  fig.align = "center"
)

## ----packages, message = FALSE-------------------------------------------
library(getTBinR)
library(ggplot2)
library(knitr)
library(magrittr)
library(dplyr)

## ----get-tb-burden-data--------------------------------------------------
tb_burden <- get_tb_burden()

tb_burden

## ----search-data-dict----------------------------------------------------
vars_of_interest <- search_data_dict(var = c("country",
                                             "e_inc_100k",
                                             "e_inc_100k_lo",
                                             "e_inc_100k_hi"))

knitr::kable(vars_of_interest)

## ----search-data-defs----------------------------------------------------
defs_of_interest <- search_data_dict(def = c("mortality"))

knitr::kable(defs_of_interest)

## ----search-data-defs-var------------------------------------------------
vars_defs_of_interest <- search_data_dict(var = c("country"),
                                     def = c("mortality"))

knitr::kable(vars_defs_of_interest)

## ----map-tb-incidence-eur, fig.width = 15--------------------------------
getTBinR::map_tb_burden(metric = "e_inc_100k")

## ----plot-tb-all, fig.height=20, fig.width = 10--------------------------
getTBinR::plot_tb_burden_overview(metric = "e_inc_100k",
                                  interactive = FALSE)

## ----plot-tb-al-per, fig.height=20, fig.width = 10-----------------------
higher_burden_countries <- tb_burden %>% 
  group_by(country) %>% 
  summarise(e_inc_100k = min(e_inc_100k)) %>% 
  filter(e_inc_100k > 5) %>% 
  pull(country) %>% 
  unique

getTBinR::plot_tb_burden_overview(metric = "e_inc_100k",
                                  interactive = FALSE,
                                  annual_change = TRUE,
                                  countries = higher_burden_countries)

## ----plot-incidence------------------------------------------------------
## Take a random sample of countries
sample_countries <- sample(unique(tb_burden$country), 9)
plot_tb_burden(tb_burden, metric = "e_inc_100k",
               countries = sample_countries)

## ----plot-incidence-facet------------------------------------------------
plot_tb_burden(tb_burden, metric = "e_inc_100k",
               countries = sample_countries,
               facet = "country")

## ----plot-incidence-facet-free-y-----------------------------------------
plot_tb_burden(tb_burden, metric = "e_inc_100k",
               countries = sample_countries,
               facet = "country",
               scales = "free_y")

## ----plot-mortality-excluding-hiv----------------------------------------
plot_tb_burden(metric = "e_mort_exc_tbhiv_100k",
               countries = sample_countries,
               facet = "country",
               scales = "free_y")

## ----plot-mortality-including-hiv----------------------------------------
plot_tb_burden(metric = "e_mort_tbhiv_100k",
               countries = sample_countries,
               facet = "country",
               scales = "free_y")

