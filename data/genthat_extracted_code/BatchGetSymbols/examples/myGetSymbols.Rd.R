library(BatchGetSymbols)


### Name: myGetSymbols
### Title: An improved version of function 'getSymbols' from quantmod
### Aliases: myGetSymbols

### ** Examples

ticker <- 'FB'

first.date <- Sys.Date()-30
last.date <- Sys.Date()

## Not run: 
##D df.ticker <- myGetSymbols(ticker,
##D                           first.date = first.date,
##D                           last.date = last.date)
## End(Not run)



