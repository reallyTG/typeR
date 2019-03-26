## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>",
  fig.width = 7, fig.height = 7, 
  fig.align = "center"
)

## ----get-packages, message = FALSE---------------------------------------
# install.packages("getTBinR")
library(getTBinR)
#  install.packages("tidyverse")
library(tidyverse)
# install.packages("viridis")
library(viridis)
# install.packages("scales")
library(scales)

## ----get-data------------------------------------------------------------
tb_burden <- get_tb_burden(verbose = FALSE)
dict <- get_data_dict(verbose = FALSE)

tb_burden

dict

## ----search-dict-inc-----------------------------------------------------
search_data_dict("cfr", verbose = FALSE) %>% 
  knitr::kable()

## ----make-inc-map, message = FALSE---------------------------------------
# Map TB incidence rates
mp1 <- map_tb_burden(verbose = FALSE, 
                     viridis_palette = "cividis", 
                     viridis_direction = -1
                     ) +
  labs(title = "Map of Tuberculosis Incidence Rates",
       subtitle = "Incidence rates are per 100,000 population")

mp1 

## ----make-cfr-map, message = FALSE---------------------------------------
# Map TB case fatality ratio -2016
mp2 <- map_tb_burden(metric = "cfr", 
                     viridis_palette = "cividis", 
                     viridis_direction = -1,
                     verbose= FALSE) +
  labs(title = "Map of Tuberculosis Case Fatality Ratio",
       subtitle = "Case fatality rate estimated by the WHO")

mp2

## ----fn-sum-rates--------------------------------------------------------
## Make function to summarise rates in a given region
rate_region <- function(df = NULL, metric = NULL) {
  
  metric_vars <- c(metric, paste0(metric, "_lo"), paste0(metric, "_hi"))
  
  df <- df %>% 
    group_by(year, g_whoregion) %>% 
    summarise_at(.vars = c(metric_vars, "e_pop_num"),
                 .funs = funs(sum(as.numeric(.), na.rm = T))) %>% 
    ungroup() %>% 
    mutate_at(.vars = metric_vars,
              .funs = funs(. / e_pop_num * 1e5))
}

## ----fn-plot-regional-rates----------------------------------------------
## Plotting function for rates
plot_rate_region <- function(df = NULL, metric = NULL, title = NULL, subtitle = NULL, 
                             y_lab = NULL, scales = NULL) {
  
  metric_vars <- c(metric, paste0(metric, "_lo"), paste0(metric, "_hi"))
  
  df %>% 
    ggplot(aes_string(x = "year", y = metric, col = "g_whoregion", 
                      fill = "g_whoregion")) +
    geom_point(size = 1.3) +
    geom_ribbon(aes_string(ymin = metric_vars[2], ymax = metric_vars[3]), alpha = 0.3) +
    geom_line(size = 1.1) +
    scale_y_continuous(labels = comma) +
    scale_colour_viridis(discrete = TRUE, option = "E") +
    scale_fill_viridis(discrete = TRUE, option = "E") +
    labs(title = title, subtitle = subtitle, 
         x = "Year", y = y_lab) +
    theme_minimal() +
    theme(legend.position = "none") +
    facet_wrap(~g_whoregion, scales = scales)
}

## ----plot-tb-inc-reg, message = FALSE------------------------------------
plot_inc_region <- tb_burden %>% 
  rate_region(metric = "e_inc_num") %>% 
  plot_rate_region(metric = "e_inc_num",
                   title = "Tuberculosis Incidence Rates",
                   subtitle = "By region and year",
                   scales = "free_y",
                   y_lab = "Tuberculosis Incidence Rates (per 100,000 population)")

plot_inc_region +
  labs(caption = "Source: World Health Organisation")

## ----plot-tb-mort-reg, message = FALSE-----------------------------------
plot_mort_region <- tb_burden %>% 
  rate_region(metric = "e_mort_num") %>% 
  plot_rate_region(metric = "e_mort_num",
                   title = "Tuberculosis Mortality Rates",
                   subtitle = "By region and year",
                   scales = "free_y",
                   y_lab = "Tuberculosis Mortality Rates (per 100,000 population)")

plot_mort_region +
  labs(caption = "Source: World Health Organisation")

## ----sum-cfr-region------------------------------------------------------
## Summarise Case fatality rate by region - only availble for most recent year
region_case_fat <- tb_burden %>% 
  filter(year %in% max(year)) %>% 
  group_by(year, g_whoregion) %>% 
  summarise(mean = mean(cfr, na.rm = TRUE),
            sd = sd(cfr, na.rm = TRUE)) %>% 
  mutate(ll = mean - sd,
         lll = mean - 2*sd,
         hh = mean + sd,
         hhh = mean + 2 * sd)

region_case_fat

## ----est-regional-cfc-all-years------------------------------------------
region_case_fatality <- tb_burden %>% 
  rate_region(metric = "e_inc_num") %>% 
  left_join(tb_burden %>% 
              rate_region(metric = "e_mort_num")) %>% 
  mutate(case_fat_rate = e_mort_num / e_inc_num,
         case_fat_rate_lo = e_mort_num_lo / e_inc_num_hi,
         case_fat_rate_hi = e_mort_num_hi / e_inc_num_lo)

region_case_fatality

## ----plot-regional-cfr, message = FALSE----------------------------------
plot_region_case_fatality <- region_case_fatality %>%
  plot_rate_region(metric = "case_fat_rate",
                   title = "Tuberculosis Case Fatality Rate",
                   subtitle = "By WHO region abd year",
                   scales = "free_y",
                   y_lab = "Estimated TB Case Fatality Ratio") +
  labs(caption = "Case fatality ratio estimated by taking the ratio of TB mortality rates and TB incidence rates each year in all years. For the most recent year 
       the mean regional case fatality ratio estimated by the WHO is also shown (along with one and two standard deviations)") +
  geom_point(data = region_case_fat, aes(y = mean, x = year, fill = g_whoregion), shape = 2, size = 1.3, col = "black") +
  geom_linerange(data = region_case_fat, aes(ymin = ll, ymax = hh, y = NULL), alpha = 0.4, size = 1.2, col = "black") +
  geom_linerange(data = region_case_fat, aes(ymin = lll, ymax = hhh, y = NULL), alpha = 0.2, size = 1.2, col = "black")
  
plot_region_case_fatality +
  labs(caption = "Source: World Health Organisation")

## ----pull-highest-cfr-countries------------------------------------------
highest_case_fataltity_countries <- tb_burden %>% 
  filter(year %in% max(year)) %>% 
  arrange(desc(cfr)) %>% 
  slice(1:10) %>% 
  pull(country)

highest_case_fataltity_countries

## ----plot-highest-cfr-countries, message = FALSE, warning = FALSE--------
## Plot overview of cases fatality ratios
plot_high_cfr <- plot_tb_burden_overview(metric = "cfr", 
                                         countries = highest_case_fataltity_countries,
                                         verbose = FALSE,
                                         viridis_palette = "cividis",
                                         viridis_direction = -1,
                                         viridis_end = 0.9) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(title = "Tuberculosis Case Fatality Ratio - 2016",
       subtitle = "For the countries with the 10 highest ratios")

plot_high_cfr

## ----plot-inc-rates-high-cfr, message = FALSE----------------------------
plot_inc_high_cfr <- plot_tb_burden_overview(countries = highest_case_fataltity_countries,
                                             verbose = FALSE,
                                             viridis_palette = "cividis",
                                             viridis_direction = -1,
                                             viridis_end = 0.9) +
  theme(legend.position = "none") +
  theme_minimal() +
  theme(legend.position = "right") +
  labs(title = "Tuberculosis Incidence Rate",
       subtitle = "In the countries with the 10 highest TB case fatality ratios")

plot_inc_high_cfr 

