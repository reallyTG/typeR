library(YRmisc)


### Name: xd.fred
### Title: Download data from Federal Reserve Bank of St. Louis
### Aliases: xd.fred

### ** Examples

 cpi <- xd.fred("CPIAUCSL") # CPI data
head(cpi)
tail(cpi)

tkr <- c("CPIAUCSL", "DGS10", "A191RO1Q156NBEA", "UNRATE")
output <- xd.fred(tkr, start_date = "1900-01-01", end_date = "2018-01-01")
head(output)
#Frequently used tickers:
#CPIAUCSL: Consumer Price Index for All Urban Consumers: All Items
#A191RL1Q225SBEA: Real Gross Domestic Product
#DGS10: 10-Year Treasury Constant Maturity Rate
#UNRATE: Civilian Unemployment Rate



