library(Rbitcoin)


### Name: market.api.process
### Title: Process market API
### Aliases: market.api.process

### ** Examples

## Not run: 
##D # get ticker from market
##D market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action='ticker')
##D # get ticker from all markets and combine
##D ticker_all <- rbindlist(list(
##D   market.api.process(market = 'bitstamp', currency_pair = c('BTC', 'USD'), action='ticker')
##D   ,market.api.process(market = 'btce', currency_pair = c('LTC', 'USD'), action='ticker')
##D   ,{Sys.sleep(10);
##D     market.api.process(market = 'btce', currency_pair = c('LTC', 'BTC'), action='ticker')}
##D   ,{Sys.sleep(10);
##D     market.api.process(market = 'btce', currency_pair = c('NMC', 'BTC'), action='ticker')}
##D   ,market.api.process(market = 'kraken', currency_pair = c('BTC','EUR'), action='ticker')
##D   ,{Sys.sleep(10);
##D     market.api.process(market = 'kraken', currency_pair = c('LTC','EUR'), action='ticker')}
##D   ,{Sys.sleep(10);
##D     market.api.process(market = 'kraken', currency_pair = c('BTC','LTC'), action='ticker')}
##D ))
##D print(ticker_all)
##D 
##D # get wallet from market
##D market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action = 'wallet',
##D                    key = '', secret = '')
##D # get wallet from all markets and combine
##D wallet_all <- rbindlist(list(
##D   market.api.process(market = 'bitstamp', currency_pair = c('BTC', 'USD'), action = 'wallet',
##D                      client_id = '', key = '', secret = ''),
##D   market.api.process(market = 'btce', currency_pair = c('LTC', 'USD'), action = 'wallet',
##D                      method = '', key = '', secret = ''),
##D   market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action = 'wallet',
##D                      key = '', secret = '')
##D ))
##D print(wallet_all)
##D 
##D # get order book from market
##D market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action = 'order_book')
##D 
##D # get open orders from market
##D market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action = 'open_orders',
##D                    key = '', secret = '')
##D 
##D # place limit order
##D market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action = 'place_limit_order',
##D                    req = list(type = 'sell', amount = 1, price = 8000), # sell 1 btc for 8000 eur
##D                    key = '', secret = '')
##D 
##D # cancel order
##D market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action = 'cancel_order,
##D                    req = list(oid = 'oid_from_open_orders'),
##D                    key = '', secret = '')
##D # get trades
##D market.api.process(market = 'kraken', currency_pair = c('BTC', 'EUR'), action = 'trades')
## End(Not run)



