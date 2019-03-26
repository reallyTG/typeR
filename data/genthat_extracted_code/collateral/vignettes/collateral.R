## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(tidyverse)

diamonds

## ------------------------------------------------------------------------
ggplot(diamonds) +
  geom_histogram(aes(x = price, y = stat(count)))

ggplot(diamonds) +
  geom_histogram(aes(x = price, y = stat(count))) +
  scale_x_log10()

## ------------------------------------------------------------------------
ggplot(diamonds) +
  geom_histogram(aes(x = price, y = stat(count))) +
  facet_wrap(vars(cut), ncol = 1) +
  scale_x_log10() +
  ggtitle('Price vs. cut')

ggplot(diamonds) +
  geom_histogram(aes(x = price, y = stat(count))) +
  facet_wrap(vars(color), ncol = 1) +
  scale_x_log10() +
  ggtitle('Price vs. color')


## ------------------------------------------------------------------------
diamonds %>% split(diamonds$cut)

## ------------------------------------------------------------------------
diamonds %>%
  split(diamonds$cut) %>%
  map_dbl(~ mean(.$price))

## ------------------------------------------------------------------------
diamonds_list = diamonds %>% split(list(diamonds$cut, diamonds$color))

map_dbl(diamonds_list, ~ mean(.$price))
map_dbl(diamonds_list, ~ cor(.$price, .$depth))

## ------------------------------------------------------------------------
nested_diamonds =
  diamonds %>%
  select(cut, color, clarity, depth, price) %>%
  nest(-cut, -color)

nested_diamonds

## ------------------------------------------------------------------------
nested_diamonds$data[[1]]

nested_diamonds$data[[2]]

## ------------------------------------------------------------------------
nested_diamonds %>%
  mutate(
    mean_price = map_dbl(data, ~ mean(.$price)),
    pd_cor =     map_dbl(data, ~ cor(.$price, .$depth)))

## ------------------------------------------------------------------------

diamonds_models =
  nested_diamonds %>%
  mutate(
    price_mod = map(data, ~ lm(.$price ~ .$depth)),
    price_summary = map(price_mod, summary),
    price_rsq = map_dbl(price_summary, 'r.squared'))

diamonds_models

## ---- eval=FALSE---------------------------------------------------------
#  nested_diamonds$data[[5]] = nested_diamonds$data[[5]] %>% filter(price < 300)
#  
#  diamonds_models =
#    nested_diamonds %>%
#    mutate(
#      price_mod = map(data, ~ lm(.$price ~ .$depth)),
#      price_summary = map(price_mod, summary),
#      price_rsq = map_dbl(price_summary, 'r.squared'))
#  
#  diamonds_models
#  #> Error in mutate_impl(.data, dots) : Evaluation error: 0 (non-NA) cases.

## ------------------------------------------------------------------------
safe_lm = safely(lm)
safe_summary = safely(summary)

purrr_models =
  nested_diamonds %>%
  mutate(price_mod = map(data, ~ safe_lm(.$price ~ .$depth)))

purrr_models

## ------------------------------------------------------------------------
purrr_models$price_mod[[1]]

purrr_models$price_mod[[5]]

purrr_models %>% mutate(mod_result = map(price_mod, 'result'))

## ------------------------------------------------------------------------
library(collateral)

nested_diamonds$data[[5]] = nested_diamonds$data[[5]] %>% filter(price < 300)

collat_models =
  nested_diamonds %>%
  mutate(price_mod = map_safely(data, ~ lm(.$price ~ .$depth)))

print(collat_models)

## ------------------------------------------------------------------------
summary(collat_models$price_mod) 

## ------------------------------------------------------------------------
collat_models %>%
  group_by(color) %>%
  summarise(
    n_res = tally_results(price_mod),
    n_err = tally_errors(price_mod))
    
collat_models %>%
  filter(has_errors(price_mod))

