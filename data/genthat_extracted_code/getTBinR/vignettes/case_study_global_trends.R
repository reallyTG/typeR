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

## ----get-data, message = FALSE-------------------------------------------
tb_burden <- get_tb_burden()
dict <- get_data_dict()

## ----search-dict-inc-----------------------------------------------------
search_data_dict(dict = dict, def = "incidence", verbose = FALSE) %>% 
  knitr::kable()

## ----map-tb-2016-inc-----------------------------------------------------
map_tb_burden(df = tb_burden, dict = dict, year = 2016,
              metric = "e_inc_100k", verbose = FALSE) +
  labs(title = "Map of Global Tuberculosis Incidence Rates - 2016",
       subtitle = "", caption = "Source: World Health Organisation")

## ----plot-region-tb-inc--------------------------------------------------
tb_inc_region <- tb_burden %>% 
  group_by(year, g_whoregion) %>% 
  summarise_at(.vars = vars(e_inc_num, e_inc_num_lo, e_inc_num_hi, e_pop_num),
               .funs = funs(sum(as.numeric(.), na.rm = T))) %>% 
  mutate_at(.vars = vars(e_inc_num, e_inc_num_lo, e_inc_num_hi),
            .funs = funs(inc_rate = . / e_pop_num * 1e5))

plot_tb_inc_region <- function(df = NULL, title = NULL, subtitle = NULL, scales = NULL) {
  df %>% 
      ggplot(aes(x = year, y = e_inc_num_inc_rate, col = g_whoregion, group = g_whoregion)) +
  geom_point() +
  geom_linerange(aes(ymin = e_inc_num_lo_inc_rate, ymax = e_inc_num_hi_inc_rate)) +
  geom_line() +
  scale_colour_viridis(discrete = TRUE) +
  labs(title = title, subtitle = subtitle, 
       x = "Year", y = "Tuberculosis Incidence Rates (per 100,000 population)",
       caption = "Source: World Health Organisation") +
  theme_minimal() +
  theme(legend.position = "none") +
  facet_wrap(~g_whoregion, scales = scales)
}

tb_inc_region %>% 
  plot_tb_inc_region(title = "Global Tuberculosis Incidence Rates",
                     subtitle = "By WHO region, with a fixed y axis",
                     scales = "fixed")

## ----plot-region-tb-inc-free---------------------------------------------
tb_inc_region %>% 
  plot_tb_inc_region(title = "Global Tuberculosis Incidence Rates",
                     subtitle = "By WHO region, with a variable y axis",
                     scales = "free_y")

## ----high-inc_increasing-------------------------------------------------
countries_inc_up <- tb_burden %>% 
  filter(year %in% c(2000, 2016)) %>% 
  group_by(country) %>% 
  arrange(desc(e_inc_100k)) %>% 
  slice(1) %>% 
  filter(year == 2016) %>% 
  pull(country)

high_inc_countries <- tb_burden %>% 
  filter(year == 2016) %>% 
  group_by(country) %>% 
  summarise(e_inc_100k = max(e_inc_100k)) %>% 
  ungroup %>% 
  arrange(desc(e_inc_100k)) %>% 
  slice(1:20) %>% 
  pull(country) %>% 
  unique

high_inc_up_countries <- intersect(countries_inc_up, high_inc_countries)

## ----plot-tb-inc-high-inc-overview---------------------------------------
plot_tb_burden_overview(df = tb_burden,
                        dict = dict, 
                        metric = "e_inc_100k", 
                        countries = high_inc_up_countries,
                        verbose = FALSE) +
  labs(title = "Tuberculosis Incidence Rates from 2000-2016",
       subtitle = "Showing countries with the highest incidence rates in which incidence rates are increasing",
       caption = "Source: World Health Organisation")

## ----plot-tb-inc-high-inc------------------------------------------------
plot_tb_burden(df = tb_burden,
               dict = dict,
               metric = "e_inc_100k", countries = high_inc_up_countries, 
               facet = "country", scales = "free_y", verbose = FALSE) +
  labs(title = "Tuberculosis Incidence Rates",
       subtitle = "Showing countries with the highest incidence rates in which incidence rates are increasing",
       caption = "Source: World Health Organisation")

## ----search-dict-report--------------------------------------------------
search_data_dict(dict = dict, def = "detection", verbose = FALSE) %>% 
  knitr::kable()

## ----plot-tb-inc-high-case-----------------------------------------------
plot_tb_burden(df = tb_burden,
               dict = dict,
               metric = "c_cdr", countries = high_inc_up_countries, 
               facet = "country", scales = "free_y", verbose = FALSE) +
  labs(title = "Tuberculosis Detection Rates",
       subtitle = "Showing countries with the highest incidence rates in which incidence rates are increasing",
       caption = "Source: World Health Organisation")

