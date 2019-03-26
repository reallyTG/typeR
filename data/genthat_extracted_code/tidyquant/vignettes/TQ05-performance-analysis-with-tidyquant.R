## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(message = FALSE,
                      warning = FALSE,
                      fig.width = 8, 
                      fig.height = 4.5,
                      fig.align = 'center',
                      out.width='95%', 
                      dpi = 200)
library(tidyquant)
# devtools::load_all() # Travis CI fails on load_all()

## ---- eval = F-----------------------------------------------------------
#  library(tidyquant)

## ------------------------------------------------------------------------
Ra <- c("AAPL", "GOOG", "NFLX") %>%
    tq_get(get  = "stock.prices",
           from = "2010-01-01",
           to   = "2015-12-31") %>%
    group_by(symbol) %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = periodReturn, 
                 period     = "monthly", 
                 col_rename = "Ra")
Ra

## ------------------------------------------------------------------------
Rb <- "XLK" %>%
    tq_get(get  = "stock.prices",
           from = "2010-01-01",
           to   = "2015-12-31") %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = periodReturn, 
                 period     = "monthly", 
                 col_rename = "Rb")
Rb

## ------------------------------------------------------------------------
RaRb <- left_join(Ra, Rb, by = c("date" = "date"))
RaRb

## ------------------------------------------------------------------------
RaRb_capm <- RaRb %>%
    tq_performance(Ra = Ra, 
                   Rb = Rb, 
                   performance_fun = table.CAPM)
RaRb_capm

## ------------------------------------------------------------------------
RaRb_capm %>%
    select(Alpha, Beta)

## ------------------------------------------------------------------------
args(SharpeRatio)

## ------------------------------------------------------------------------
stock_prices <- c("AAPL", "GOOG", "NFLX") %>%
    tq_get(get  = "stock.prices",
           from = "2010-01-01",
           to   = "2015-12-31")
stock_prices

## ------------------------------------------------------------------------
stock_returns_monthly <- stock_prices %>%
    group_by(symbol) %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = periodReturn, 
                 period     = "monthly", 
                 col_rename = "Ra")
stock_returns_monthly

## ------------------------------------------------------------------------
stock_returns_monthly %>%
    tq_performance(Ra = Ra, 
                   Rb = NULL, 
                   performance_fun = SharpeRatio)

## ------------------------------------------------------------------------
stock_returns_monthly %>%
    tq_performance(Ra = Ra, 
                   Rb = NULL, 
                   performance_fun = SharpeRatio, 
                   Rf = 0.03 / 12, 
                   p = 0.99)

## ---- eval = F-----------------------------------------------------------
#  stock_returns_monthly <- c("AAPL", "GOOG", "NFLX") %>%
#      tq_get(get  = "stock.prices",
#             from = "2010-01-01",
#             to   = "2015-12-31") %>%
#      group_by(symbol) %>%
#      tq_transmute(select     = adjusted,
#                   mutate_fun = periodReturn,
#                   period     = "monthly",
#                   col_rename = "Ra")
#  stock_returns_monthly

## ---- echo = F-----------------------------------------------------------
# NOT SHOWN
stock_returns_monthly <- Ra
stock_returns_monthly

## ---- eval = F-----------------------------------------------------------
#  baseline_returns_monthly <- "XLK" %>%
#      tq_get(get  = "stock.prices",
#             from = "2010-01-01",
#             to   = "2015-12-31") %>%
#      tq_transmute(select     = adjusted,
#                   mutate_fun = periodReturn,
#                   period     = "monthly",
#                   col_rename = "Rb")
#  baseline_returns_monthly

## ---- echo = F-----------------------------------------------------------
# NOT SHOWN
baseline_returns_monthly <- Rb
baseline_returns_monthly

## ------------------------------------------------------------------------
wts <- c(0.5, 0.0, 0.5)
portfolio_returns_monthly <- stock_returns_monthly %>%
    tq_portfolio(assets_col  = symbol, 
                 returns_col = Ra, 
                 weights     = wts, 
                 col_rename  = "Ra")
portfolio_returns_monthly

## ------------------------------------------------------------------------
wts_map <- tibble(
    symbols = c("AAPL", "NFLX"),
    weights = c(0.5, 0.5)
)
wts_map

## ------------------------------------------------------------------------
stock_returns_monthly %>%
    tq_portfolio(assets_col  = symbol, 
                 returns_col = Ra, 
                 weights     = wts_map, 
                 col_rename  = "Ra_using_wts_map")

## ------------------------------------------------------------------------
RaRb_single_portfolio <- left_join(portfolio_returns_monthly, 
                                   baseline_returns_monthly,
                                   by = "date")
RaRb_single_portfolio

## ------------------------------------------------------------------------
RaRb_single_portfolio %>%
    tq_performance(Ra = Ra, Rb = Rb, performance_fun = table.CAPM)

## ---- eval = F-----------------------------------------------------------
#  stock_returns_monthly <- c("AAPL", "GOOG", "NFLX") %>%
#      tq_get(get  = "stock.prices",
#             from = "2010-01-01",
#             to   = "2015-12-31") %>%
#      group_by(symbol) %>%
#      tq_transmute(select     = adjusted,
#                   mutate_fun = periodReturn,
#                   period     = "monthly",
#                   col_rename = "Ra")

## ---- eval = F-----------------------------------------------------------
#  baseline_returns_monthly <- "XLK" %>%
#      tq_get(get  = "stock.prices",
#             from = "2010-01-01",
#             to   = "2015-12-31") %>%
#      tq_transmute(select     = adjusted,
#                   mutate_fun = periodReturn,
#                   period     = "monthly",
#                   col_rename = "Rb")

## ------------------------------------------------------------------------
stock_returns_monthly_multi <- stock_returns_monthly %>%
    tq_repeat_df(n = 3)
stock_returns_monthly_multi

## ------------------------------------------------------------------------
weights <- c(
    0.50, 0.25, 0.25,
    0.25, 0.50, 0.25,
    0.25, 0.25, 0.50
)
stocks <- c("AAPL", "GOOG", "NFLX")
weights_table <-  tibble(stocks) %>%
    tq_repeat_df(n = 3) %>%
    bind_cols(tibble(weights)) %>%
    group_by(portfolio)
weights_table

## ------------------------------------------------------------------------
portfolio_returns_monthly_multi <- stock_returns_monthly_multi %>%
    tq_portfolio(assets_col  = symbol, 
                 returns_col = Ra, 
                 weights     = weights_table, 
                 col_rename  = "Ra")
portfolio_returns_monthly_multi

## ------------------------------------------------------------------------
RaRb_multiple_portfolio <- left_join(portfolio_returns_monthly_multi, 
                                     baseline_returns_monthly,
                                     by = "date")
RaRb_multiple_portfolio

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = Rb, performance_fun = table.CAPM)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = SharpeRatio)

## ------------------------------------------------------------------------
tq_performance_fun_options()

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = table.Stats)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = Rb, performance_fun = table.CAPM)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = table.AnnualizedReturns)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = Rb, performance_fun = table.Correlation)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = table.DownsideRisk)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = table.DownsideRiskRatio)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = Rb, performance_fun = table.HigherMoments)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = Rb, performance_fun = table.InformationRatio)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = table.Variability)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = VaR)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra = Ra, Rb = NULL, performance_fun = SharpeRatio)

## ------------------------------------------------------------------------
args(Return.portfolio)

## ---- eval=F-------------------------------------------------------------
#  wts <- c(0.5, 0.0, 0.5)
#  portfolio_returns_monthly <- stock_returns_monthly %>%
#      tq_portfolio(assets_col  = symbol,
#                   returns_col = Ra,
#                   weights     = wts,
#                   col_rename  = "Ra")

## ------------------------------------------------------------------------
portfolio_returns_monthly %>%
    ggplot(aes(x = date, y = Ra)) +
    geom_bar(stat = "identity", fill = palette_light()[[1]]) +
    labs(title = "Portfolio Returns",
         subtitle = "50% AAPL, 0% GOOG, and 50% NFLX",
         caption = "Shows an above-zero trend meaning positive returns",
         x = "", y = "Monthly Returns") +
    geom_smooth(method = "lm") +
    theme_tq() +
    scale_color_tq() +
    scale_y_continuous(labels = scales::percent)

## ------------------------------------------------------------------------
wts <- c(0.5, 0, 0.5)
portfolio_growth_monthly <- stock_returns_monthly %>%
    tq_portfolio(assets_col   = symbol, 
                 returns_col  = Ra, 
                 weights      = wts, 
                 col_rename   = "investment.growth",
                 wealth.index = TRUE) %>%
    mutate(investment.growth = investment.growth * 10000)

## ------------------------------------------------------------------------
portfolio_growth_monthly %>%
    ggplot(aes(x = date, y = investment.growth)) +
    geom_line(size = 2, color = palette_light()[[1]]) +
    labs(title = "Portfolio Growth",
         subtitle = "50% AAPL, 0% GOOG, and 50% NFLX",
         caption = "Now we can really visualize performance!",
         x = "", y = "Portfolio Value") +
    geom_smooth(method = "loess") +
    theme_tq() +
    scale_color_tq() +
    scale_y_continuous(labels = scales::dollar)

## ------------------------------------------------------------------------
portfolio_growth_monthly_multi <- stock_returns_monthly_multi %>%
    tq_portfolio(assets_col   = symbol, 
                 returns_col  = Ra, 
                 weights      = weights_table, 
                 col_rename   = "investment.growth",
                 wealth.index = TRUE) %>%
    mutate(investment.growth = investment.growth * 10000)

## ------------------------------------------------------------------------
portfolio_growth_monthly_multi %>%
    ggplot(aes(x = date, y = investment.growth, color = factor(portfolio))) +
    geom_line(size = 2) +
    labs(title = "Portfolio Growth",
         subtitle = "Comparing Multiple Portfolios",
         caption = "Portfolio 3 is a Standout!",
         x = "", y = "Portfolio Value",
         color = "Portfolio") +
    geom_smooth(method = "loess") +
    theme_tq() +
    scale_color_tq() +
    scale_y_continuous(labels = scales::dollar)

## ------------------------------------------------------------------------
args(SharpeRatio)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra              = Ra, 
                   performance_fun = SharpeRatio)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra              = Ra, 
                   performance_fun = SharpeRatio,
                   Rf              = 0.03 / 12)

## ------------------------------------------------------------------------
RaRb_multiple_portfolio %>%
    tq_performance(Ra              = Ra, 
                   performance_fun = SharpeRatio,
                   Rf              = 0.03 / 12, 
                   p               = 0.99)

