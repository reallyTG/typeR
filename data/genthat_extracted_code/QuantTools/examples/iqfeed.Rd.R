library(QuantTools)


### Name: iqfeed
### Title: IQFeed
### Aliases: iqfeed

### ** Examples

## No test: 
symbol = 'MSFT'
to = format( Sys.time() )
from = format( Sys.time() - as.difftime( 3, units = 'days' ) )
days = 10
# ticks
get_iqfeed_data( symbol, from, to, 'tick' )
# candles
get_iqfeed_data( symbol, from, to, '1min' )
# daily candles
get_iqfeed_data( symbol, from, to )
## End(No test)




