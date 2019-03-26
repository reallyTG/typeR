library(gets)


### Name: sp500data
### Title: Daily Standard and Poor's 500 index data
### Aliases: sp500data
### Keywords: datasets

### ** Examples

data(sp500data)
sp500data <- zoo(sp500data[, -1], order.by = as.Date(sp500data[, "Date"]))
plot(window(sp500data, start = as.Date("2000-01-03")))



