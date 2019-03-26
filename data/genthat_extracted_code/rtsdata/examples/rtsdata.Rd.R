library(rtsdata)


### Name: rtsdata
### Title: 'rtsdata' - Efficient Data Storage system for R Time Series.
### Aliases: rtsdata rtsdata-package

### ** Examples

 # small toy example

 # register data source to generate fake stock data for use in rtsdata examples
 register.data.source(src = 'sample', data = ds.getSymbol.fake.stock.data)
 
 # Full Update till '2018-02-13'
 data = getSymbols('test', src = 'sample', from = '2018-01-01', to = '2018-02-13', 
					auto.assign=FALSE, verbose=TRUE)
 
 # No updated needed, data is loaded from file
 data = getSymbols('test', src = 'sample', from = '2018-01-01', to = '2018-02-13', 
					auto.assign=FALSE, verbose=TRUE)

 # Incremental update from '2018-02-13' till today
 data = getSymbols('test', src = 'sample', from = '2018-01-01', 
					auto.assign=FALSE, verbose=TRUE)

 # No updated needed, data is loaded from file
 data = getSymbols('test', src = 'sample', from = '2018-01-01', 
					auto.assign=FALSE, verbose=TRUE)

	# data is stored in the 'sample_Rdata' folder at the following location
	ds.default.location()





