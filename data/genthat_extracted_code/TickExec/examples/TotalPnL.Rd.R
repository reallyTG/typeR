library(TickExec)


### Name: TotalPnL
### Title: Calculate Total PnL for Given Protfolio
### Aliases: TotalPnL
### Keywords: PnL

### ** Examples

## locate tick data directory ##
dir <- system.file("extdata", '', package = "TickExec")

## establish a posiyion to sell ##
dfLog = LimitBuy(dir = dir, date = 20141013, ticker = 000001, capital = 1e6, 
                 limitPrice = NA, orderFrom = 94545, orderLast = 600, 
                 costIn = 0.001, market = 'SHSZ')

## sell ##
dfLogSold = MarketSell(dir = dir, date = 20141014, orderTime = 140001, 
                       dfLog = dfLog, costOut = 0.001, market = 'SHSZ')
                       
## market worth ##
TotalPnL(dir = dir, df = dfLogSold, date = 20141014, time = 145900, 
               market = 'SHSZ')



