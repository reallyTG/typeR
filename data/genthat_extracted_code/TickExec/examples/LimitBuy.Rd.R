library(TickExec)


### Name: LimitBuy
### Title: Execute Limit Buy Order
### Aliases: LimitBuy
### Keywords: limit buy order

### ** Examples

## locate tick data directory ##
dir <- system.file("extdata", '', package = "TickExec")

## Execute order, given duration ##
dfLog1 = LimitBuy(dir = dir, date = 20141013, ticker = 000001, capital = 1e6, 
                 limitPrice = NA, orderFrom = 94545, orderLast = 600, 
                 costIn = 0.001, market = 'SHSZ')
                 
## Execute order, given ending time ##
dfLog2 = LimitBuy(dir = dir, date = 20141013, ticker = 000001, capital = 1e6, 
                 limitPrice = NA, orderFrom = 94545, orderTo = 100001, 
                 costIn = 0.001, market = 'SHSZ')
                  
## see result ##
dfLog1
dfLog2



