library(TickExec)


### Name: MarketBuy
### Title: Execute Market Buy Order
### Aliases: MarketBuy
### Keywords: market buy order

### ** Examples

## locate tick data directory ##
dir <- system.file("extdata", '', package = "TickExec")

## Execute order ##
dfLog = MarketBuy(dir = dir, date = 20141010, ticker = 000001, capital = 1e5,
                  orderTime = 94545, costIn = 0.001, market = 'SHSZ')
                  
## see result ##
dfLog



