library(pedquant)


### Name: pq_plot
### Title: creating charts for time series
### Aliases: pq_plot

### ** Examples

## No test: 
# single symbol
ssec = md_stock("^000001", source="163", date_range = 'max')

# chart type
  pq_plot(ssec, chart_type = "line",   date_range = '6m') # line chart (default)
# pq_plot(ssec, chart_type = "step",   date_range = '6m') # step line
# pq_plot(ssec, chart_type = "candle", date_range = '6m') # candlestick
# pq_plot(ssec, chart_type = "bar",    date_range = '6m') # bar chart

# add technical indicators
pq_plot(ssec, chart_type = "line", addti = list(
        sma = list(n = 200), 
        sma = list(n = 50), 
        macd = list()
))
# linear trend with yaxis in log
pq_plot(ssec, chart_type = "line", linear_trend = c(-0.8, 0, 0.8), yaxis_log = TRUE)


# multiple symbols
# download datasets
# dat = md_stock(c('FB', 'AMZN', 'AAPL', 'NFLX', 'GOOG'), date_range = 'max')
dat = md_stock(c('^000001', '^399001', '^399006', '^000016', '^000300', '^000905'), 
               date_range = 'max', source='163')

# linear trend
pq_plot(dat, multi_series=list(nrow=2, scales='free_y'), linear_trend=c(-0.8, 0, 0.8))
pq_plot(dat, multi_series=list(nrow=2, scales='free_y'), linear_trend=c(-0.8, 0, 0.8), 
        yaxis_log=TRUE)

# performance
pq_plot(dat, multi_series = list(nrow=2), perf=TRUE, date_range = 'ytd')
pq_plot(dat, multi_series = list(nrow=1, ncol=1), perf=TRUE, date_range = 'ytd')

## End(No test)




