library(stocks)


### Name: targetbeta_twofunds
### Title: Backtest a Two-Fund Strategy that Targets a Certain Beta
### Aliases: targetbeta_twofunds

### ** Examples

## Not run: 
##D # Backtest zero-beta UPRO/VBLTX strategy
##D beta0 <- targetbeta_twofunds(tickers = c("UPRO", "VBLTX"), target.beta = 0)
##D plot(beta0$fund.balances[, "Portfolio"])
## End(Not run)




