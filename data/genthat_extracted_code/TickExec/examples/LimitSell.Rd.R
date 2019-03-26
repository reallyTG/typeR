library(TickExec)


### Name: LimitSell
### Title: Execute Limit Sell Order
### Aliases: LimitSell
### Keywords: limit sell order

### ** Examples

## locate tick data directory ##
dir <- system.file("extdata", '', package = "TickExec")

## establish a posiyion to sell ##
dfLog = LimitBuy(dir = dir, date = 20141013, ticker = 000001, capital = 1e6, 
                 limitPrice = NA, orderFrom = 94545, orderLast = 600, 
                 costIn = 0.001, , market = 'SHSZ')

## sell ##
dfLogSold = LimitSell(dir = dir, date = 20141013, dfLog = dfLog, limitPrice = 10.1, 
                      orderFrom = 142020, orderTo = 150000, costOut = 0.001, 
                      market = 'SHSZ') 
                       
## see result ##
dfLogSold



