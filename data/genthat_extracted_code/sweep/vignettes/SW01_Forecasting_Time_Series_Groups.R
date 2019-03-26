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
library(timetk)
library(forecast)
# devtools::load_all() # Travis CI fails on load_all()

## ---- eval = F-----------------------------------------------------------
#  library(forecast)
#  library(tidyquant)
#  library(timetk)
#  library(sweep)

## ------------------------------------------------------------------------
bike_sales

## ------------------------------------------------------------------------
bike_sales_monthly <- bike_sales %>%
    mutate(month = month(order.date, label = TRUE),
           year  = year(order.date)) %>%
    group_by(year, month) %>%
    summarise(total.qty = sum(quantity)) 
bike_sales_monthly

## ------------------------------------------------------------------------
bike_sales_monthly %>%
    ggplot(aes(x = month, y = total.qty, group = year)) +
    geom_area(aes(fill = year), position = "stack") +
    labs(title = "Quantity Sold: Month Plot", x = "", y = "Sales",
         subtitle = "March through July tend to be most active") +
    scale_y_continuous() +
    theme_tq()

## ------------------------------------------------------------------------
monthly_qty_by_cat2 <- bike_sales %>%
    mutate(order.month = as_date(as.yearmon(order.date))) %>%
    group_by(category.secondary, order.month) %>%
    summarise(total.qty = sum(quantity))
monthly_qty_by_cat2

## ------------------------------------------------------------------------
monthly_qty_by_cat2_nest <- monthly_qty_by_cat2 %>%
    group_by(category.secondary) %>%
    nest(.key = "data.tbl")
monthly_qty_by_cat2_nest

## ------------------------------------------------------------------------
monthly_qty_by_cat2_ts <- monthly_qty_by_cat2_nest %>%
    mutate(data.ts = map(.x       = data.tbl, 
                         .f       = tk_ts, 
                         select   = -order.month, 
                         start    = 2011,
                         freq     = 12))
monthly_qty_by_cat2_ts

## ------------------------------------------------------------------------
monthly_qty_by_cat2_fit <- monthly_qty_by_cat2_ts %>%
    mutate(fit.ets = map(data.ts, ets))
monthly_qty_by_cat2_fit

## ------------------------------------------------------------------------
monthly_qty_by_cat2_fit %>%
    mutate(tidy = map(fit.ets, sw_tidy)) %>%
    unnest(tidy, .drop = TRUE) %>%
    spread(key = category.secondary, value = estimate)

## ------------------------------------------------------------------------
monthly_qty_by_cat2_fit %>%
    mutate(glance = map(fit.ets, sw_glance)) %>%
    unnest(glance, .drop = TRUE)

## ------------------------------------------------------------------------
augment_fit_ets <- monthly_qty_by_cat2_fit %>%
    mutate(augment = map(fit.ets, sw_augment, timetk_idx = TRUE, rename_index = "date")) %>%
    unnest(augment, .drop = TRUE)

augment_fit_ets

## ------------------------------------------------------------------------
augment_fit_ets %>%
    ggplot(aes(x = date, y = .resid, group = category.secondary)) +
    geom_hline(yintercept = 0, color = "grey40") +
    geom_line(color = palette_light()[[2]]) +
    geom_smooth(method = "loess") +
    labs(title = "Bike Quantity Sold By Secondary Category",
         subtitle = "ETS Model Residuals", x = "") + 
    theme_tq() +
    facet_wrap(~ category.secondary, scale = "free_y", ncol = 3) +
    scale_x_date(date_labels = "%Y")

## ------------------------------------------------------------------------
monthly_qty_by_cat2_fit %>%
    mutate(decomp = map(fit.ets, sw_tidy_decomp, timetk_idx = TRUE, rename_index = "date")) %>%
    unnest(decomp)

## ------------------------------------------------------------------------
monthly_qty_by_cat2_fcast <- monthly_qty_by_cat2_fit %>%
    mutate(fcast.ets = map(fit.ets, forecast, h = 12))
monthly_qty_by_cat2_fcast

## ------------------------------------------------------------------------
monthly_qty_by_cat2_fcast_tidy <- monthly_qty_by_cat2_fcast %>%
    mutate(sweep = map(fcast.ets, sw_sweep, fitted = FALSE, timetk_idx = TRUE)) %>%
    unnest(sweep)
monthly_qty_by_cat2_fcast_tidy

## ---- fig.height=7-------------------------------------------------------
monthly_qty_by_cat2_fcast_tidy %>%
    ggplot(aes(x = index, y = total.qty, color = key, group = category.secondary)) +
    geom_ribbon(aes(ymin = lo.95, ymax = hi.95), 
                fill = "#D5DBFF", color = NA, size = 0) +
    geom_ribbon(aes(ymin = lo.80, ymax = hi.80, fill = key), 
                fill = "#596DD5", color = NA, size = 0, alpha = 0.8) +
    geom_line() +
    labs(title = "Bike Quantity Sold By Secondary Category",
         subtitle = "ETS Model Forecasts",
         x = "", y = "Units") +
    scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
    scale_color_tq() +
    scale_fill_tq() +
    facet_wrap(~ category.secondary, scales = "free_y", ncol = 3) +
    theme_tq() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

