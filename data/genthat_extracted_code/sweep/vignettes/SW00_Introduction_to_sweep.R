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
alcohol_sales_tbl <- tq_get("S4248SM144NCEN", 
                            get  = "economic.data", 
                            from = "2007-01-01",
                            to   = "2016-12-31")
alcohol_sales_tbl

## ------------------------------------------------------------------------
alcohol_sales_tbl %>%
    ggplot(aes(x = date, y = price)) +
    geom_line(size = 1, color = palette_light()[[1]]) +
    geom_smooth(method = "loess") +
    labs(title = "US Alcohol Sales: Monthly", x = "", y = "Millions") +
    scale_y_continuous(labels = scales::dollar) +
    scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
    theme_tq()

## ------------------------------------------------------------------------
alcohol_sales_ts <- tk_ts(alcohol_sales_tbl, start = 2007, freq = 12, silent = TRUE)
alcohol_sales_ts

## ------------------------------------------------------------------------
has_timetk_idx(alcohol_sales_ts)

## ------------------------------------------------------------------------
fit_ets <- alcohol_sales_ts %>%
    ets()

## ---- echo = F-----------------------------------------------------------
tibble::tribble(
    ~Object,       ~`sw_tidy()`, ~`sw_glance()`, ~`sw_augment()`, ~`sw_tidy_decomp()`, ~`sw_sweep()`,
    "ar",          "",  "",  "", "",   "",
    "arima",       "X", "X", "X", "",  "",
    "Arima",       "X", "X", "X", "",  "",
    "ets",         "X", "X", "X", "X", "",
    "baggedETS",   "",  "",  "",  "",  "",
    "bats",        "X", "X", "X", "X", "",
    "tbats",       "X", "X", "X", "X", "",
    "nnetar",      "X", "X", "X", "",  "",
    "stl",         "",  "",  "",  "X", "",
    "HoltWinters", "X", "X", "X", "X", "",
    "StructTS",      "X", "X", "X", "X", "",
    "tslm",        "X", "X", "X", "",  "",
    "decompose",   "",  "",  "",  "X", "",
    "adf.test",    "X", "X", "",  "",  "",
    "Box.test",    "X", "X", "",  "",  "",
    "kpss.test",   "X", "X", "",  "",  "",
    "forecast",    "",  "",  "",  "",  "X"
) %>%
    knitr::kable(caption = "Function Compatibility",
                 align = c("l", "c", "c", "c", "c", "c"))

## ------------------------------------------------------------------------
sw_tidy(fit_ets)

## ------------------------------------------------------------------------
sw_glance(fit_ets)

## ------------------------------------------------------------------------
augment_fit_ets <- sw_augment(fit_ets)
augment_fit_ets

## ------------------------------------------------------------------------
augment_fit_ets %>%
    ggplot(aes(x = index, y = .resid)) +
    geom_hline(yintercept = 0, color = "grey40") +
    geom_point(color = palette_light()[[1]], alpha = 0.5) +
    geom_smooth(method = "loess") +
    scale_x_yearmon(n = 10) +
    labs(title = "US Alcohol Sales: ETS Residuals", x = "") + 
    theme_tq()

## ------------------------------------------------------------------------
decomp_fit_ets <- sw_tidy_decomp(fit_ets)
decomp_fit_ets 

## ------------------------------------------------------------------------
decomp_fit_ets %>%
    gather(key = key, value = value, -index) %>%
    mutate(key = forcats::as_factor(key)) %>%
    ggplot(aes(x = index, y = value, group = key)) +
    geom_line(color = palette_light()[[2]]) +
    geom_ma(ma_fun = SMA, n = 12, size = 1) +
    facet_wrap(~ key, scales = "free_y") +
    scale_x_yearmon(n = 10) +
    labs(title = "US Alcohol Sales: ETS Decomposition", x = "") + 
    theme_tq() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

## ------------------------------------------------------------------------
fcast_ets <- fit_ets %>%
    forecast(h = 12) 

## ------------------------------------------------------------------------
sw_sweep(fcast_ets, fitted = TRUE)

## ------------------------------------------------------------------------
sw_sweep(fcast_ets) %>%
    ggplot(aes(x = index, y = price, color = key)) +
    geom_ribbon(aes(ymin = lo.95, ymax = hi.95), 
                fill = "#D5DBFF", color = NA, size = 0) +
    geom_ribbon(aes(ymin = lo.80, ymax = hi.80, fill = key), 
                fill = "#596DD5", color = NA, size = 0, alpha = 0.8) +
    geom_line(size = 1) +
    labs(title = "US Alcohol Sales, ETS Model Forecast", x = "", y = "Millions",
         subtitle = "Regular Time Index") +
    scale_y_continuous(labels = scales::dollar) +
    scale_x_yearmon(n = 12, format = "%Y") +
    scale_color_tq() +
    scale_fill_tq() +
    theme_tq() 

## ------------------------------------------------------------------------
sw_sweep(fcast_ets, timetk_idx = TRUE) %>%
    head()

## ------------------------------------------------------------------------
sw_sweep(fcast_ets, timetk_idx = TRUE) %>%
    tail()

## ------------------------------------------------------------------------
sw_sweep(fcast_ets, timetk_idx = TRUE) %>%
    ggplot(aes(x = index, y = price, color = key)) +
    geom_ribbon(aes(ymin = lo.95, ymax = hi.95), 
                fill = "#D5DBFF", color = NA, size = 0) +
    geom_ribbon(aes(ymin = lo.80, ymax = hi.80, fill = key), 
                fill = "#596DD5", color = NA, size = 0, alpha = 0.8) +
    geom_line(size = 1) +
    labs(title = "US Alcohol Sales, ETS Model Forecast", x = "", y = "Millions", 
         subtitle = "Irregular Time Index") +
    scale_y_continuous(labels = scales::dollar) +
    scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
    scale_color_tq() +
    scale_fill_tq() +
    theme_tq() 

