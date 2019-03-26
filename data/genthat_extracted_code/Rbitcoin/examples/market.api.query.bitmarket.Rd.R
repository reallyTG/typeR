library(Rbitcoin)


### Name: market.api.query.bitmarket
### Title: Send request to bitmarket market API
### Aliases: market.api.query.bitmarket

### ** Examples

## Not run: 
##D # ticker
##D market.api.query.bitmarket(url = 'https://www.bitmarket.pl/json/LTCPLN/ticker.json')
##D # wallet
##D market.api.query.bitmarket(url = 'https://www.bitmarket.pl/api2/',
##D                            req = list(method = 'info'),
##D                            key = '', secret = '')
## End(Not run)



