library(GetHFData)


### Name: ghfd_build_lob
### Title: Building LOB (limit order book) from orders
### Aliases: ghfd_build_lob

### ** Examples

## Not run: 
##D library(GetHFData)
##D first.time <- '11:00:00'
##D last.time <- '17:00:00'
##D first.date <- as.Date('2015-11-03')
##D last.date <- as.Date('2015-11-03')
##D type.output <- 'raw'
##D type.data <- 'orders'
##D type.market = 'equity-odds'
##D 
##D df.out <- ghfd_get_HF_data(my.assets =my.assets,
##D                           type.market = type.market,
##D                           type.data = type.data,
##D                           first.date = first.date,
##D                           last.date = last.date,
##D                           first.time = first.time,
##D                           last.time = last.time,
##D                           type.output = type.output)
##D                           
##D df.lob <- ghfd_build_lob(df.out)
## End(Not run)



