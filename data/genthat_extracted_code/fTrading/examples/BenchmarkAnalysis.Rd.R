library(fTrading)


### Name: BenchmarkAnalysis
### Title: Utilities and Benchmark Analysis
### Aliases: BenchmarkAnalysis ohlcPlot sharpeRatio sterlingRatio
###   maxDrawDown
### Keywords: math

### ** Examples

## ohlcPlot -
   # Plot OHLC for SP500
   # ohlcPlot(x, ylab = "price", main = instrument)
   
## sharpeRatio -
   # Sharpe Ratio for DAX and FTSE:
   data(EuStockMarkets)
   dax = log(EuStockMarkets[, "DAX"])
   ftse = log(EuStockMarkets[, "FTSE"])
   # Ratios:
   sharpeRatio(dax)
   sharpeRatio(ftse)
   
## maxDrawDown -
   data(EuStockMarkets)
   dax = log(EuStockMarkets[, "DAX"])
   mdd = maxDrawDown(dax)
   mdd
   # Plot DAX:
   plot(dax)
   grid()
   segments(time(dax)[mdd$from], dax[mdd$from],
     time(dax)[mdd$to], dax[mdd$from])
   segments(time(dax)[mdd$from], dax[mdd$to],
     time(dax)[mdd$to], dax[mdd$to])
   mid = time(dax)[(mdd$from + mdd$to)/2]
   arrows(mid, dax[mdd$from], mid, dax[mdd$to], col = 2)
   title(main = "DAX: Max Drawdown")



