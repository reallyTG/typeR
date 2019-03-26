library(BatchGetSymbols)


### Name: BatchGetSymbols
### Title: Function to download financial data
### Aliases: BatchGetSymbols

### ** Examples

tickers <- c('FB','MMM')

first.date <- Sys.Date()-30
last.date <- Sys.Date()

l.out <- BatchGetSymbols(tickers = tickers,
                         first.date = first.date,
                        last.date = last.date, do.cache=FALSE)

print(l.out$df.control)
print(l.out$df.tickers)



