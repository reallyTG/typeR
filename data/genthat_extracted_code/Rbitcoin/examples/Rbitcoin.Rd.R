library(Rbitcoin)


### Name: Rbitcoin
### Title: R & bitcoin integration
### Aliases: BTC Rbitcoin Rbitcoin-package bitcoin btc

### ** Examples

## Not run: 
##D # default options used by Rbitcoin
##D 
##D # print Rbitcoin processing to console set "Rbitcoin.verbose" to 1 (or more)
##D options(Rbitcoin.verbose=0)
##D 
##D # print Rcurl processing to console set RCurlOptions[["verbose"]] to TRUE
##D options(RCurlOptions=list(ssl.verifypeer = TRUE,
##D                           ssl.verifyhost = TRUE,
##D                           cainfo = system.file("CurlSSL","cacert.pem",package="RCurl"),
##D                           verbose = FALSE))
##D 
##D # currency type dictionary used by wallet_manager
##D options(Rbitcoin.ct.dict = list(
##D   crypto = c('BTC','LTC','NMC', ...),
##D   fiat = c('USD','EUR','GBP', ...)
##D ))
## End(Not run)



