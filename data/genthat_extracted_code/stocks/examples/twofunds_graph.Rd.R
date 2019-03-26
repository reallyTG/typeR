library(stocks)


### Name: twofunds_graph
### Title: Graph One Performance Metric vs. Another for Two-Fund Portfolios
###   as Allocation Varies
### Aliases: twofunds_graph

### ** Examples

## Not run: 
##D # Plot mean vs. SD for UPRO/VBLTX portfolio, and compare to VFINX and BRK-B
##D fig1 <- twofunds_graph(tickers = c("UPRO", "VBLTX"), 
##D                        reference.tickers = c("VFINX", "BRK-B"))
##D                      
##D # Same funds, but annualized growth vs. maximum drawdown
##D fig2 <- twofunds_graph(tickers = c("UPRO", "VBLTX"), 
##D                        reference.tickers = c("VFINX", "BRK-B"),
##D                        x.metric = "mdd", y.metric = "cagr")
## End(Not run)




