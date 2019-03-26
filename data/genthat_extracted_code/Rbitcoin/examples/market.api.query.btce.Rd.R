library(Rbitcoin)


### Name: market.api.query.btce
### Title: Send request to btce market API
### Aliases: market.api.query.btce

### ** Examples

## Not run: 
##D # ticker
##D market.api.query.btce(url = 'https://btc-e.com/api/2/btc_usd/ticker')
##D # wallet
##D market.api.query.btce(url = 'https://btc-e.com/tapi',
##D                       req = list(method = 'getInfo'),
##D                       key = '', secret = '')
## End(Not run)



