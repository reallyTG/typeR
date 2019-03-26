library(GetHFData)


### Name: ghfd_get_HF_data
### Title: Downloads and aggregates high frequency trading data directly
###   from the Bovespa ftp
### Aliases: ghfd_get_HF_data

### ** Examples


my.assets <- 'ABEVA69'
type.market <- 'options'
first.date <- as.Date('2015-12-29')
last.date <- as.Date('2015-12-29')

## Not run: 
##D df.out <- ghfd_get_HF_data(my.assets, type.market, first.date,  last.date)
## End(Not run)



