library(Rbitcoin)


### Name: wallet_manager
### Title: Wallet Manager
### Aliases: wallet_manager

### ** Examples

## Not run: 
##D ## define source
##D # define wallets on markets
##D market.sources <- list(
##D   list(market = 'bitstamp', currency_pair = c('BTC', 'USD'),
##D        client_id = '', key = '', secret = ''),
##D   list(market = 'btce', currency_pair = c('LTC', 'USD'),
##D        key = '', secret = ''),
##D   list(market = 'btce', currency_pair = c('LTC', 'USD'),
##D        key = '', secret = ''), #multiple accounts on same market possible
##D   list(market = 'kraken', currency_pair = c('BTC', 'EUR'),
##D        key = '', secret = '')
##D )
##D # define wallets on blockchain
##D blockchain.sources <- list(
##D   list(address = ''),
##D   list(address = '')
##D )
##D # define wallets manually
##D manual.sources <- list(
##D   list(location = 'while transferring',
##D        currency = c('BTC','LTC'),
##D        amount = c(0.08, 0)),
##D   # manually provided value as workaround for bitstamp api unavailability captcha bug
##D   list(location = 'bitstamp',
##D        location_type = 'market'
##D        currency = c('USD','BTC'),
##D        amount = c(50,0.012))
##D )
##D 
##D ## launch wallet manager with no value calculation
##D wallet_dt <- wallet_manager(market.sources,
##D                             blockchain.sources,
##D                             manual.sources,
##D                             value_calc = FALSE)
##D print(wallet_dt)
##D 
##D ## launch wallet manager
##D wallet_dt <- wallet_manager(
##D   market.sources = market.sources,
##D   blockchain.sources = blockchain.sources,
##D   manual.sources = manual.sources,
##D   value_currency = 'GBP',
##D   rate_priority = c('bitstamp','kraken','bitmarket','btce')
##D   archive_write = TRUE
##D )
##D print(wallet_dt)
##D 
##D # export to excel/google spreadsheet
##D setkey(wallet_dt,wallet_id,currency) #sort
##D write.table(wallet_dt, "clipboard", sep="\t", row.names=FALSE, na = "")
##D # now go to excel or google spreadsheet and use "paste" from clipboard
##D 
##D # aggregate measures by currency and type
##D wallet_dt[,list(amount = sum(amount, na.rm=T),
##D                 value = sum(value, na.rm=T)),
##D            by = c('wallet_id','currency','value_currency')
##D            ][order(wallet_id,currency,value_currency)]
##D # aggregate value by location and type
##D wallet_dt[,list(value = sum(value, na.rm=T)),
##D            by = c('wallet_id','location_type','location')
##D            ][order(wallet_id,location_type,location)]
##D 
##D # send to plot
##D wallet_dt <- wallet_manager(archive_write=F, archive_read=T)
##D Rbitcoin.plot(wallet_dt)
##D 
##D # discard processing batch, by id, from wallet archive (will omit on plot)
##D dt <- readRDS("wallet_archive.rds")
##D dt[wallet_id==1390000000,`:=`(amount = NA_real_, value = NA_real_)]
##D saveRDS(dt, "wallet_archive.rds")
##D 
##D # To track exchange rates used set option Rbitcoin.archive_exchange_rate
##D options(Rbitcoin.archive_exchange_rate=0)
##D wallet_dt <- wallet_manager(market.sources,
##D                             blockchain.sources,
##D                             manual.sources = manual.sources,
##D                             rate_priority = c('bitstamp','kraken','bitmarket','btce')
##D                             archive_write = TRUE)
##D # all exchange rate data as dt
##D dt <- readRDS("exchange_rate_archive.rds")
##D # last exchange rate table as dt
##D dt <- readRDS("exchange_rate_archive.rds")[value_rate_id==max(value_rate_id)]
##D # save to csv
##D write.table(dt, "exchange_rate_archive.csv",
##D             row.names=FALSE,quote=FALSE,append=FALSE,col.names=TRUE,
##D             sep=";", dec=",")
## End(Not run)



