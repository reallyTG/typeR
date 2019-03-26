library(stocks)


### Name: targetall
### Title: Backtest a Fixed-Allocation Trading Strategy
### Aliases: targetall

### ** Examples

## Not run: 
##D # Backtest equal-allocation UPRO/VBLTX/VWEHX strategy
##D port <- targetall(tickers = c("UPRO", "VBLTX", "VWEHX"))
##D plot(port$fund.balances[, "Portfolio"])
## End(Not run)




