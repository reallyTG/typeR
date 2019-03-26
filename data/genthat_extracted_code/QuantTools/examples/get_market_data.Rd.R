library(QuantTools)


### Name: get_market_data
### Title: Download historical market data
### Aliases: get_market_data get_yahoo_data get_yahoo_splits_and_dividends
###   get_google_data get_finam_data get_iqfeed_data get_moex_options_data
###   get_moex_futures_data get_moex_continuous_futures_data

### ** Examples

## No test: 
get_finam_data( 'GAZP', '2015-01-01', '2016-01-01' )
get_finam_data( 'GAZP', '2015-01-01', '2016-01-01', 'hour' )
get_finam_data( 'GAZP', Sys.Date(), Sys.Date(), 'tick' )

get_iqfeed_data( 'MSFT', '2015-01-01', '2016-01-01' )
get_iqfeed_data( 'MSFT', '2015-01-01', '2016-01-01', 'hour' )
get_iqfeed_data( 'MSFT', Sys.Date() - 3, Sys.Date() , 'tick' )

get_google_data( 'MSFT', '2015-01-01', '2016-01-01' )
get_yahoo_data( 'MSFT', '2015-01-01', '2016-01-01' )

get_moex_futures_data( 'RIH9', '2009-01-01', '2009-02-01', 'tick', local = T )
get_moex_options_data( 'RI55000C9', '2009-01-01', '2009-02-01', 'tick', local = T )
get_moex_continuous_futures_data( 'RI', '2016-01-01', '2016-11-01', frequency = 3, day_exp = 15 )

## End(No test)



