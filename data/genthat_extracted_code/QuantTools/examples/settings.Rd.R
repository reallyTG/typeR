library(QuantTools)


### Name: settings
### Title: QuantTools settings
### Aliases: settings QuantTools_settings QuantTools_settings_defaults

### ** Examples

## No test: 

# list all settings
QuantTools_settings()

# set defaults
QuantTools_settings_defaults()

# change a setting
QuantTools_settings( list( iqfeed_verbose = TRUE ) )

# To make R remember your settings please add the following code
# to .Rprofile file stored in your home directory path.expand('~'):

suppressMessages( library( QuantTools ) )

QuantTools_settings( settings = list(
  iqfeed_storage = paste( path.expand('~') , 'Market Data', 'iqfeed', sep = '/' ),
  iqfeed_symbols = c( 'AAPL', '@ES#' ),
  iqfeed_storage_from = format( Sys.Date() - 3 )
) )

## End(No test)



