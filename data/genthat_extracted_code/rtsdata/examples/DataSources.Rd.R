library(rtsdata)


### Name: register.data.source
### Title: Data Sources
### Aliases: register.data.source data.sources

### ** Examples

 # register data source to generate fake stock data for use in rtsdata examples
 register.data.source(src = 'sample', data = ds.getSymbol.fake.stock.data)

 # print allregistered data sources
 names(data.sources())




