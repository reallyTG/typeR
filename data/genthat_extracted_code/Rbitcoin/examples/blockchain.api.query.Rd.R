library(Rbitcoin)


### Name: blockchain.api.query
### Title: Query blockchain.info API
### Aliases: blockchain.api.query

### ** Examples

## Not run: 
##D # query bitcoin address information - 'Single Address' method
##D # Rbitcoin donation address final balance in BTC
##D blockchain.api.query('15Mb2QcgF3XDMeVn6M7oCG6CQLw4mkedDi',limit=0)[['final_balance']]/100000000
##D # Rbitcoin donation address full details
##D blockchain.api.query('15Mb2QcgF3XDMeVn6M7oCG6CQLw4mkedDi',verbose=1)
##D # some first wallet final balance in BTC
##D blockchain.api.query('1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa',limit=0)[['final_balance']]/100000000
##D # some first wallet details (limit to 3 txs, skip two txs)
##D blockchain.api.query(method = 'Single Address',
##D                      bitcoin_address = '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa', limit=3, offset=2)
##D # query bitcoin transaction information - 'Single Transaction' method
##D # Some recent transaction of some first wallet
##D blockchain.api.query('e5c4de1c70cb6d60db53410e871e9cab6a0ba75404360bf4cda1b993e58d45f8')
## End(Not run)



