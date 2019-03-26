## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  collapse = TRUE,
  comment = "#>"
)

## ----load_data-----------------------------------------------------------
suppressPackageStartupMessages({
  library(magrittr)
  library(dplyr)
  library(stringr)
  library(tidyr)
  library(purrr)
  library(broom)
  library(knitr)
  library(scales)
  library(kayadata)
})

kaya <- get_kaya_data("United States")

## ----plot_P_1990, fig.cap = str_c("Trend in population for U.S. from 1990--", max(kaya$year, na.rm = T))----
plot_kaya(kaya, "P", log_scale = TRUE, start_year = 1990, trend_line = TRUE, points = FALSE) +
  theme_bw()

## ----plot_g_1990, fig.cap = str_c("Trend in per-capita GDP for U.S. from 1990--", max(kaya$year, na.rm = T))----
plot_kaya(kaya, "g", log_scale = TRUE, start_year = 1990, trend_line = TRUE, points = FALSE) +
  theme_bw()

## ----plot_e_1990, fig.cap = str_c("Trend in primary-energy intensity of the U.S. economy from 1990--", max(kaya$year, na.rm = T))----
plot_kaya(kaya, "e", log_scale = TRUE, start_year = 1990, trend_line = TRUE, points = FALSE) +
  theme_bw()

## ----plot_f_1990, fig.cap = str_c("Trend in the carbon-dioxide intensity of the U.S. energy supply from 1990--", max(kaya$year, na.rm = T))----
plot_kaya(kaya, "f", log_scale = TRUE, start_year = 1990, trend_line = TRUE, points = FALSE) +
  theme_bw()

## ----plot_f_2005, fig.cap = str_c("Trend in the carbon-dioxide intensity of the U.S. energy supply from 2005--", max(kaya$year, na.rm = T))----
plot_kaya(kaya, "f", log_scale = TRUE, start_year = 2005, trend_line = TRUE, points = FALSE) +
  theme_bw()

## ----compute-bottom-up-rates---------------------------------------------
vars <- c("P", "g", "e", "f")
historical_trends <- map_dbl(vars, 
                 ~kaya %>% 
                   gather(key = variable, value = value, -region, -year) %>%
                   filter(variable == .x, 
                          year >= ifelse(.x == "f", 2005, 1990)) %>%
                   lm(log(value) ~ year, data = .) %>% tidy() %>%
                   filter(term == "year") %$% estimate
) %>% set_names(vars)

tibble(Variable = names(historical_trends), 
       Rate = map_chr(historical_trends, ~percent(.x, 0.01))) %>%
  kable(align = c("c", "r"))

## ----implied_rate_F------------------------------------------------------
ref_year <- 2005
target_years <- c(2025, 2050)
target_reduction <- c(0.26, 0.80)

F_ref <- kaya %>% filter(year == ref_year) %$% F
F_target <- tibble(year = target_years, F = F_ref * (1 - target_reduction)) %>%
  mutate(implied_rate = log(F / F_ref) / (year - ref_year))

F_target %>% 
  mutate(implied_rate = map_chr(implied_rate, ~percent(.x,  0.01))) %>%
  rename("Target F" = F, "Implied Rate" = implied_rate) %>%
  kable(align = c("crr"), digits = 0)

## ----implied_decarb_bottom_up--------------------------------------------
implied_decarb_rates <- F_target %>% 
  transmute(year, impl_F = implied_rate, 
            hist_G = historical_trends['P'] + historical_trends['g'],
            hist_ef = historical_trends['e'] + historical_trends['f'],
            impl_ef = impl_F - hist_G)

implied_decarb_rates %>% 
  mutate_at(vars(starts_with("hist_"), starts_with("impl_")),
            list(~map_chr(., ~percent(.x, 0.01)))) %>%
  select(Year = year, 
         "implied F" = impl_F, 
         "historical G" = hist_G,
         "implied ef" = impl_ef, 
         "historical ef" = hist_ef
  ) %>%
  kable(align="rrrrr")

## ----top_down_trends-----------------------------------------------------
top_down_trends <- get_top_down_trends("United States")

top_down_trends %>% select(P, G, E) %>%
  mutate_all(list(~map_chr(., ~percent(.x, 0.01)))) %>%
  rename("P trend" = P, "G trend" = G, "E trend" = E) %>%
  kable(align="rrr")

## ----implied_decarb_top_down---------------------------------------------
implied_decarb_rates_top_down <- F_target %>% 
  transmute(year, impl_F = implied_rate, 
            top_down_E = top_down_trends$E,
            hist_f = historical_trends['f'],
            impl_f = impl_F - top_down_E)

implied_decarb_rates_top_down %>% 
  mutate_at(vars(starts_with("hist_"), starts_with("impl_"), 
                 starts_with("top_down")),
            list(~map_chr(., ~percent(.x, 0.01)))) %>%
  select(Year = year, 
         "implied F" = impl_F, 
         "top-down E" = top_down_E,
         "implied f" = impl_f, 
         "historical f" = hist_f
  ) %>%
  kable(align="rrrrr")

