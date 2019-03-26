library(Rbitcoin)


### Name: market.api.query
### Title: Send request to market API
### Aliases: market.api.query

### ** Examples

## Not run: 
##D # ticker
##D market.api.query(market = 'bitstamp',
##D                  url = 'https://www.bitstamp.net/api/ticker/')
##D market.api.query(market = 'btce',
##D                  url = 'https://btc-e.com/api/2/btc_usd/ticker')
##D market.api.query(market = 'kraken',
##D                  url = 'https://api.kraken.com/0/public/Ticker?pair=XXBTZEUR')
##D market.api.query(market = 'bitmarket',
##D                  url = 'https://www.bitmarket.pl/json/LTCPLN/ticker.json')
##D # wallet
##D market.api.query(market = 'bitstamp',
##D                  url = 'https://www.bitstamp.net/api/balance/',
##D                  client_id = '', # bitstamp specific
##D                  key = '', secret = '')
##D market.api.query(market = 'btce',
##D                  url = 'https://btc-e.com/tapi',
##D                  req = list(method = 'getInfo'),
##D                  key = '', secret = '')
##D market.api.query(market = 'kraken',
##D                  url = 'https://api.kraken.com/0/private/Balance',
##D                  key = '', secret = '')
##D market.api.query(market = 'bitmarket',
##D                  url = 'https://www.bitmarket.pl/api2/',
##D                  req = list(method = 'info'),
##D                  key = '', secret = '')
##D # order book
##D market.api.query(market = 'kraken',
##D                  url = 'https://api.kraken.com/0/public/Depth?pair=XXBTZEUR')
##D # open orders
##D market.api.query(market = 'kraken',
##D                  url = 'https://api.kraken.com/0/private/OpenOrders',
##D                  key = '', secret = '')
##D # place order
##D market.api.query(market = 'kraken',
##D                  url = 'https://api.kraken.com/0/private/AddOrder',
##D                  key = '', secret = '',
##D                  req = list(pair = 'XXBTZEUR',
##D                             type = 'sell',
##D                             ordertype = 'limit',
##D                             price = 1200, # 1200 eur
##D                             volume = 0.1)) # 0.1 btc
##D # cancel order
##D market.api.query(market = 'kraken',
##D                  url = 'https://api.kraken.com/0/private/CancelOrder',
##D                  key = '', secret = '',
##D                  req = list(txid = 'id_from_open_orders'))
##D # trades
##D market.api.query(market = 'kraken',
##D                  url = 'https://api.kraken.com/0/public/Trades?pair=XXBTZEUR')
## End(Not run)



