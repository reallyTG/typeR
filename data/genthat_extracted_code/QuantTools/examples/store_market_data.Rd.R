library(QuantTools)


### Name: store_market_data
### Title: Store historical market data
### Aliases: store_market_data store_finam_data store_iqfeed_data
###   store_moex_data

### ** Examples

## No test: 

## Finam data storage
settings = list(
  # set storage path, it is perfect to use Solid State Drive for data storage
  # it is no problem to move storage folder just don't forget to set new path in settings
  finam_storage = paste( path.expand('~') , 'Market Data', 'finam', sep = '/' ),
  # add some symbols
  finam_symbols = c( 'GAZP', 'SBER' ),
  # and set storage start date
  finam_storage_from = '2016-09-01'
)
QuantTools_settings( settings )
# now it is time to add some data into storage. You have three options here:

  # 1 update storage with data from last date available until today
  # it is very convenient to create a script with this function and
  # run it every time you need to update your storage
  store_finam_data()

  # 2 update storage with data from last date available until specified date
  store_finam_data( to = '2016-09-28' )

  # 3 update storage with data between from and to dates,
  # if data already present it will be overwritten
  store_finam_data( from = '2016-01-01', to = '2016-01-10' )

# set local = TRUE to load from just created local market data storage
get_finam_data( 'GAZP', '2016-09-01', '2016-09-28', 'tick', local = T )

## IQFeed data storage
settings = list(
  # set storage path, it is perfect to use Solid State Drive for data storage
  # it is no problem to move storage folder just don't forget to set new path in settings
  iqfeed_storage = paste( path.expand('~') , 'Market Data', 'iqfeed', sep = '/' ),
  # add some symbols
  iqfeed_symbols = c( 'AAPL', '@ES#' ),
  # and set storage start date
  iqfeed_storage_from = format( Sys.Date() - 3 )
)
QuantTools_settings( settings )
# now it is time to add some data into storage. You have three options here:

  # 1 update storage with data from last date available until today
  # it is very convenient to create a script with this function and
  # run it every time you need to update your storage
  store_iqfeed_data()

  # 2 update storage with data from last date available until specified date
  store_iqfeed_data( to = format( Sys.Date() ) )

  # 3 update storage with data between from and to dates,
  # if data already present it will be overwritten
  store_iqfeed_data( from = format( Sys.Date() - 3 ), to = format( Sys.Date() ) )

# set local = TRUE to load from just created local market data storage
get_iqfeed_data( 'AAPL', format( Sys.Date() - 3 ), format( Sys.Date() ), 'tick', local = T )

## MOEX data storage
settings = list(
  # set MOEX data url
  moex_data_url = 'url/to/moex/data',
  # set storage path, it is perfect to use Solid State Drive for data storage
  # it is no problem to move storage folder just don't forget to set new path in settings
  moex_storage = paste( path.expand('~') , 'Market Data', 'moex', sep = '/' ),
  # and set storage start date
  moex_storage_from = '2003-01-01'
)
QuantTools_settings( settings )
# now it is time to add some data into storage. You have three options here:

  # 1 update storage with data from last date available until today
  # it is very convenient to create a script with this function and
  # run it every time you need to update your storage
  store_moex_data()

  # 2 update storage with data from last date available until specified date
  store_moex_data( to = format( Sys.Date() ) )

  # 3 update storage with data between from and to dates,
  # if data already present it will be overwritten
  store_moex_data( from = format( Sys.Date() - 3 ), to = format( Sys.Date() ) )

# set local = TRUE to load from just created local market data storage
get_moex_futures_data( 'RIH9', '2009-01-01', '2009-02-01', 'tick', local = T )

## End(No test)



