library(PortRisk)


### Name: volatility
### Title: Individual Volatility of Stock(s)
### Aliases: volatility

### ** Examples

data(SnP500Returns)
tckk <- colnames(SnP500Returns)

# volatility of the stock of the company Apple
# for the time period January 1, 2013 - January 31, 2013
volatility("AAPL", start = "2013-01-01",
            end = "2013-01-31", data = SnP500Returns)

# volatility of the first three stocks in SnP500Returns
# for the time period January 1, 2013 - January 31, 2013
volatility(tickers = tckk[1:3], start = "2013-01-01",
            end = "2013-01-31", data = SnP500Returns)



