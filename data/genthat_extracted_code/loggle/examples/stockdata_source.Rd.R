library(loggle)


### Name: stockdata_source
### Title: Source code for stock prices of S&P 500 companies from 2007 to
###   2016
### Aliases: stockdata_source

### ** Examples

library(XML)
library(RCurl)
library(quantmod)

# select one stock of interest
stock.ticker <- "MSFT"

# extract stock information from wiki
url <- "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"
tabs <- getURL(url)
stock.info <- readHTMLTable(tabs, stringsAsFactors = FALSE)[[1]]
stock.ticker.all <- stock.info$`Ticker symbol`
stock.name.all <- stock.info$Security
stock.sector.all <- stock.info$`GICS Sector`
stock.index <- which(stock.ticker.all == stock.ticker)
stock.name <- stock.name.all[stock.index]
stock.sector <- stock.sector.all[stock.index]

# extract stock closing prices and indices of dates
stock.price <- getSymbols(stock.ticker, auto.assign=FALSE, 
from='2007-01-01', to="2017-01-01")[, 4]
date.index <- as.character(index(stock.price))

# summary of selected stock
cat(sprintf("Ticker: %s\nName: %s\nSector: %s\nMin Price: %.2f (%s)
Max Price: %.2f (%s)", stock.ticker, stock.name, stock.sector, 
min(stock.price), date.index[which.min(stock.price)], 
max(stock.price), date.index[which.max(stock.price)]))



