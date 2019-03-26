library(TickExec)


### Name: PerformanceReport
### Title: Summarize Back Test Performance
### Aliases: PerformanceReport
### Keywords: performance

### ** Examples

## locate tick data directory ##
dir <- system.file("extdata", '', package = "TickExec")
ticker = 000001

df <- c()
pnl <- c()

for (d in 20141012:20141017) {

dfLog = LimitBuy(dir = dir, date = d, ticker = ticker, capital = 1e6, 
                 limitPrice = NA, orderFrom = 94545, orderLast = 600, 
                 costIn = 0.001, market = 'SHSZ')

dfLogSold = MarketSell(dir = dir, date = d, orderTime = 140001, 
                       dfLog = dfLog, costOut = 0.001, market = 'SHSZ')


df <- rbind(df, dfLogSold)
pnl <- c(pnl, TotalPnL(dir = dir, df = df, date = d))
}

PerformanceReport(df = df, cumPnL = pnl, initCap = 1e6)



