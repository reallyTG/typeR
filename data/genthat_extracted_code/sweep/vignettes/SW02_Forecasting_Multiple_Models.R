## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(
    # message = FALSE,
    # warning = FALSE,
    fig.width = 8, 
    fig.height = 4.5,
    fig.align = 'center',
    out.width='95%', 
    dpi = 200
)
library(tidyquant)
library(sweep)
library(forecast)
library(timetk)
# devtools::load_all() # Travis CI fails on load_all()

## ---- eval = F-----------------------------------------------------------
#  library(forecast)
#  library(tidyquant)
#  library(timetk)
#  library(sweep)

## ------------------------------------------------------------------------
gas_prices_monthly_raw <- tq_get(
    x    = "GASREGCOVM", 
    get  = "economic.data", 
    from = "1990-01-01", 
    to   = "2016-12-31") 
gas_prices_monthly_raw

## ------------------------------------------------------------------------
summary(gas_prices_monthly_raw$price)

## ------------------------------------------------------------------------
gas_prices_monthly <- gas_prices_monthly_raw %>%
    fill(price, .direction = "down") %>%
    fill(price, .direction = "up")

## ------------------------------------------------------------------------
gas_prices_monthly %>%
    ggplot(aes(x = date, y = price)) +
    geom_line(color = palette_light()[[1]]) +
    geom_point(color = palette_light()[[1]]) +
    labs(title = "Gasoline Prices, Monthly", x = "", y = "USD") +
    scale_y_continuous(labels = scales::dollar) +
    theme_tq()

## ------------------------------------------------------------------------
gas_prices_quarterly <- gas_prices_monthly %>%
    tq_transmute(mutate_fun = to.period, period = "quarters") 
gas_prices_quarterly

## ------------------------------------------------------------------------
gas_prices_quarterly %>%
    ggplot(aes(x = date, y = price)) +
    geom_line(color = palette_light()[[1]], size = 1) +
    geom_point(color = palette_light()[[1]]) +
    labs(title = "Gasoline Prices, Quarterly", x = "", y = "USD") +
    scale_y_continuous(labels = scales::dollar) +
    scale_x_date(date_breaks = "5 years", date_labels = "%Y") +
    theme_tq()

## ------------------------------------------------------------------------
df <- tibble(
  f = c("runif", "rpois", "rnorm"),
  params = list(
    list(n = 10),
    list(n = 5, lambda = 10),
    list(n = 10, mean = -3, sd = 10)
  )
)
df

## ------------------------------------------------------------------------
df$params

## ------------------------------------------------------------------------
df_out <- df %>% 
    mutate(out = invoke_map(f, params))
df_out

## ------------------------------------------------------------------------
df_out$out

## ------------------------------------------------------------------------
gas_prices_quarterly_ts <- gas_prices_quarterly %>% 
    tk_ts(select = -date, start = c(1990, 3), freq = 4)
gas_prices_quarterly_ts

## ------------------------------------------------------------------------
models_list <- list(
    auto.arima = list(
        y = gas_prices_quarterly_ts
        ),
    ets = list(
        y = gas_prices_quarterly_ts,
        damped = TRUE
    ),
    bats = list(
        y = gas_prices_quarterly_ts
    )
)

## ------------------------------------------------------------------------
models_tbl <- enframe(models_list, name = "f", value = "params")
models_tbl

## ------------------------------------------------------------------------
models_tbl_fit <- models_tbl %>%
    mutate(fit = invoke_map(f, params))
models_tbl_fit

## ------------------------------------------------------------------------
models_tbl_fit %>%
    mutate(tidy = map(fit, sw_tidy)) %>%
    unnest(tidy) %>%
    spread(key = f, value = estimate)

## ------------------------------------------------------------------------
models_tbl_fit %>%
    mutate(glance = map(fit, sw_glance)) %>%
    unnest(glance, .drop = TRUE)

## ---- warning=F, fig.height=8--------------------------------------------
models_tbl_fit %>%
    mutate(augment = map(fit, sw_augment, rename_index = "date")) %>%
    unnest(augment) %>%
    ggplot(aes(x = date, y = .resid, group = f)) +
    geom_line(color = palette_light()[[2]]) +
    geom_point(color = palette_light()[[1]]) +
    geom_smooth(method = "loess") +
    facet_wrap(~ f, nrow = 3) +
    labs(title = "Residuals Plot") +
    theme_tq()

## ------------------------------------------------------------------------
models_tbl_fcast <- models_tbl_fit %>%
    mutate(fcast = map(fit, forecast, h = 6))
models_tbl_fcast

## ------------------------------------------------------------------------
models_tbl_fcast_tidy <- models_tbl_fcast %>%
    mutate(sweep = map(fcast, sw_sweep, fitted = FALSE, timetk_idx = TRUE, rename_index = "date"))
models_tbl_fcast_tidy

## ------------------------------------------------------------------------
models_tbl_fcast_tidy %>%
    unnest(sweep)

## ---- fig.height=8-------------------------------------------------------
models_tbl_fcast_tidy %>%
    unnest(sweep) %>%
    ggplot(aes(x = date, y = price, color = key, group = f)) +
    geom_ribbon(aes(ymin = lo.95, ymax = hi.95), 
                fill = "#D5DBFF", color = NA, size = 0) +
    geom_ribbon(aes(ymin = lo.80, ymax = hi.80, fill = key), 
                fill = "#596DD5", color = NA, size = 0, alpha = 0.8) +
    geom_line(size = 1) +
    facet_wrap(~f, nrow = 3) +
    labs(title = "Gasoline Price Forecasts",
         subtitle = "Forecasting multiple models with sweep: ARIMA, BATS, ETS",
         x = "", y = "Price") +
    scale_y_continuous(labels = scales::dollar) +
    scale_x_date(date_breaks = "5 years", date_labels = "%Y") +
    theme_tq() +
    scale_color_tq()

