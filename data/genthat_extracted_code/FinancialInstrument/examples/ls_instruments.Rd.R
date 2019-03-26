library(FinancialInstrument)


### Name: ls_instruments
### Title: List or Remove instrument objects
### Aliases: ls_instruments ls_stocks ls_options ls_option_series
###   ls_futures ls_future_series ls_currencies ls_non_currencies
###   ls_exchange_rates ls_FX ls_bonds ls_funds ls_spreads
###   ls_guaranteed_spreads ls_synthetics ls_derivatives ls_non_derivatives
###   ls_calls ls_puts rm_instruments rm_stocks rm_options rm_option_series
###   rm_futures rm_future_series rm_currencies rm_exchange_rates rm_FX
###   rm_bonds rm_funds rm_spreads rm_synthetics rm_derivatives
###   rm_non_derivatives ls_stocks ls_options ls_option_series ls_futures
###   ls_future_series ls_currencies ls_non_currencies ls_exchange_rates
###   ls_FX ls_bonds ls_funds ls_spreads ls_guaranteed_spreads
###   ls_synthetics ls_ICS ls_ICS_roots ls_derivatives ls_non_derivatives
###   ls_calls ls_puts rm_instruments rm_stocks rm_options rm_option_series
###   rm_futures rm_future_series rm_currencies rm_exchange_rates rm_FX
###   rm_bonds rm_funds rm_spreads rm_synthetics rm_derivatives
###   rm_non_derivatives

### ** Examples


## Not run: 
##D #rm_instruments(keep.currencies=FALSE) #remove everything from .instrument
##D 
##D # First, create some instruments
##D currency(c("USD", "EUR", "JPY"))
##D #stocks
##D stock(c("S", "SE", "SEE", "SPY"), 'USD')
##D synthetic("SPX", "USD", src=list(src='yahoo', name='^GSPC'))
##D #derivatives
##D option('.SPY', 'USD', multiplier=100, underlying_id='SPY')
##D option_series(root_id="SPY", expires='2011-06-18', callput='put', strike=130)
##D option_series(root_id="SPY", expires='2011-09-17', callput='put', strike=130)
##D option_series(root_id="SPY", expires='2011-06-18', callput='call', strike=130)
##D future('ES', 'USD', multiplier=50, expires='2011-09-16', underlying_id="SPX")
##D option('.ES','USD',multiplier=1, expires='2011-06',strike=1350, right='C', underlying_id='ES')
##D 
##D # Now, the examples
##D ls_instruments() #all instruments
##D ls_instruments("SE") #only the one stock
##D ls_instruments("S", match=FALSE) #anything with "S" in name
##D 
##D ls_currencies()
##D ls_stocks() 
##D ls_options() 
##D ls_futures() 
##D ls_derivatives()
##D ls_puts()
##D ls_non_derivatives()
##D #ls_by_expiry('20110618',ls_puts()) #put options that expire on Jun 18th, 2011
##D #ls_puts(ls_by_expiry('20110618')) #same thing
##D 
##D rm_options('SPY_110618C130')
##D rm_futures()
##D ls_instruments()
##D #rm_instruments('EUR') #Incorrect
##D rm_instruments('EUR', keep.currencies=FALSE) #remove the currency
##D rm_currencies('JPY') #or remove currency like this
##D ls_currencies()
##D ls_instruments()
##D 
##D rm_instruments() #remove all but currencies
##D rm_currencies()
##D 
##D option_series.yahoo('DIA')
##D ls_instruments_by('underlying_id','DIA') #underlying_id must exactly match 'DIA'
##D ls_derivatives('DIA',match=FALSE) #primary_ids that contain 'DIA'
##D rm_instruments()
## End(Not run)



