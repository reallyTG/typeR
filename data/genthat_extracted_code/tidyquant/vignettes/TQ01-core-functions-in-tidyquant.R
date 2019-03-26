## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(message = FALSE,
                      warning = FALSE,
                      fig.width = 8, 
                      fig.height = 4.5,
                      fig.align = 'center',
                      out.width='95%', 
                      dpi = 200)
# devtools::load_all() # Travis CI fails on load_all()

## ------------------------------------------------------------------------
# Loads tidyquant, tidyverse, lubridate, xts, quantmod, TTR 
library(tidyquant)

## ------------------------------------------------------------------------
tq_index_options()

## ---- eval = FALSE-------------------------------------------------------
#  tq_index("SP500")

## ---- eval=FALSE---------------------------------------------------------
#  tq_exchange("NASDAQ")

## ------------------------------------------------------------------------
tq_get_options()

## ------------------------------------------------------------------------
aapl_prices  <- tq_get("AAPL", get = "stock.prices", from = " 1990-01-01")
aapl_prices 

## ---- eval = F-----------------------------------------------------------
#  x8411T <- tq_get("8411.T", get = "stock.prices.japan", from = "2016-01-01", to  = "2016-12-31")

## ------------------------------------------------------------------------
aapl_divs <- tq_get("AAPL", get = "dividends", from = "1990-01-01")
aapl_divs

## ------------------------------------------------------------------------
aapl_splits <- tq_get("AAPL", get = "splits", from = "1990-01-01")
aapl_splits

## ------------------------------------------------------------------------
# aapl_financials <- tq_get("AAPL", get = "financials")
# aapl_financials

## ------------------------------------------------------------------------
# aapl_financials %>%
#     filter(type == "IS") %>%
#     select(annual) %>%
#     unnest()

## ------------------------------------------------------------------------
# aapl_financials %>%
#     unnest(quarter) %>% 
#     spread(key = date, value = value)

## ------------------------------------------------------------------------
aapl_key_ratios <- tq_get("AAPL", get = "key.ratios")
aapl_key_ratios

## ------------------------------------------------------------------------
aapl_key_ratios %>%
    filter(section == "Valuation Ratios") %>%
    unnest()

## ------------------------------------------------------------------------
aapl_key_ratios %>%
    filter(section == "Valuation Ratios") %>%
    unnest() %>%
    ggplot(aes(x = date, y = value)) +
    geom_line(aes(col = factor(category, levels = c("Price to Earnings", "Price to Cash Flow", "Price to Book", "Price to Sales"))), 
              size = 1)  + 
    labs(title = "10-Year Historical Valuation Ratios for AAPL", x = "", 
         y = "", col = "") +
    theme_tq() +
    scale_color_tq()

## ---- eval = F-----------------------------------------------------------
#  quandl_api_key("enter-your-api-key-here")

## ---- eval = F-----------------------------------------------------------
#  quandl_search(query = "Oil", database_code = "NSE", per_page = 3)

## ---- eval = F-----------------------------------------------------------
#  c("WIKI/FB", "WIKI/AAPL") %>%
#      tq_get(get  = "quandl",
#             from = "2016-01-01",
#             to   = "2016-12-31")

## ---- eval = F-----------------------------------------------------------
#  c("WIKI/FB", "WIKI/AAPL") %>%
#      tq_get(get          = "quandl",
#             from         = "2007-01-01",
#             to           = "2016-12-31",
#             column_index = 11,
#             collapse     = "annual",
#             transform    = "rdiff")

## ---- eval = F-----------------------------------------------------------
#  # Zacks Fundamentals Collection B (DOW 30 Available to non subscribers)
#  tq_get("ZACKS/FC", get = "quandl.datatable")   # Zacks Fundamentals Condensed
#  tq_get("ZACKS/FR", get = "quandl.datatable")   # Zacks Fundamental Ratios
#  tq_get("ZACKS/MT", get = "quandl.datatable")   # Zacks Master Table
#  tq_get("ZACKS/MKTV", get = "quandl.datatable") # Zacks Market Value Supplement
#  tq_get("ZACKS/SHRS", get = "quandl.datatable") # Zacks Shares Out Supplement

## ---- eval = F-----------------------------------------------------------
#  av_api_key("enter-your-api-key-here")

## ---- eval = F-----------------------------------------------------------
#  # Scaling is as simple as supplying multiple symbols
#  my_intraday_data <- c("FB", "MSFT") %>%
#      tq_get(get = "alphavantager", av_fun = "TIME_SERIES_INTRADAY", interval = "5min")

## ---- eval = F-----------------------------------------------------------
#  blpConnect()

## ---- eval = F-----------------------------------------------------------
#  # Get Bloomberg data in a tidy data frame
#  my_bloomberg_data <- c('SPX Index','ODMAX Equity') %>%
#      tq_get(get         = "Rblpapi",
#             rblpapi_fun = "bdh",
#             fields      = c("PX_LAST"),
#             options     = c("periodicitySelection" = "WEEKLY"),
#             from        = "2016-01-01",
#             to          = "2016-12-31")

## ------------------------------------------------------------------------
wti_price_usd <- tq_get("DCOILWTICO", get = "economic.data")
wti_price_usd 

## ------------------------------------------------------------------------
eur_usd <- tq_get("EUR/USD", 
                  get = "exchange.rates", 
                  from = Sys.Date() - lubridate::days(10))
eur_usd 

## ------------------------------------------------------------------------
plat_price_eur <- tq_get("plat", get = "metal.prices", 
                         from = Sys.Date() - lubridate::days(10),
                         base.currency = "EUR")
plat_price_eur 

## ------------------------------------------------------------------------
data(FANG)
FANG

## ------------------------------------------------------------------------
FANG %>%
    group_by(symbol) %>%
    tq_transmute(select = adjusted, mutate_fun = to.monthly, indexAt = "lastof")

## ---- message=FALSE, warning=FALSE---------------------------------------
wti_prices <- tq_get("DCOILWTICO", get = "economic.data") 
wti_prices %>%    
    tq_transmute(mutate_fun = to.period,
                 period = "months", 
                 col_rename = "WTI Price")

## ------------------------------------------------------------------------
FANG %>%
    group_by(symbol) %>%
    tq_mutate(select     = close, 
              mutate_fun = MACD, 
              col_rename = c("MACD", "Signal"))

## ------------------------------------------------------------------------
fb_returns <- tq_get("FB", get  = "stock.prices", from = "2016-01-01", to   = "2016-12-31") %>%
    tq_transmute(adjusted, periodReturn, period = "weekly", col_rename = "fb.returns")

xlk_returns <- tq_get("XLK", from = "2016-01-01", to = "2016-12-31") %>%
    tq_transmute(adjusted, periodReturn, period = "weekly", col_rename = "xlk.returns")

returns_combined <- left_join(fb_returns, xlk_returns, by = "date")
returns_combined

## ------------------------------------------------------------------------
regr_fun <- function(data) {
    coef(lm(fb.returns ~ xlk.returns, data = timetk::tk_tbl(data, silent = TRUE)))
}

## ------------------------------------------------------------------------
returns_combined %>%
    tq_mutate(mutate_fun = rollapply,
              width      = 12,
              FUN        = regr_fun,
              by.column  = FALSE,
              col_rename = c("coef.0", "coef.1"))
returns_combined

## ---- message=FALSE, warning=FALSE---------------------------------------
FANG %>%
    group_by(symbol) %>%
    tq_mutate_xy(x = close, y = volume, 
                 mutate_fun = EVWMA, col_rename = "EVWMA")

