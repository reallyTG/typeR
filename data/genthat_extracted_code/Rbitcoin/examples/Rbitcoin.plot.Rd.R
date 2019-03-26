library(Rbitcoin)


### Name: Rbitcoin.plot
### Title: Plot Rbitcoin objects
### Aliases: Rbitcoin.plot

### ** Examples

## Not run: 
##D # plot trades data from kraken's api
##D trades <- market.api.process('kraken',c('BTC','EUR'),'trades')
##D Rbitcoin.plot(trades)
##D Rbitcoin.plot(trades,export=TRUE,col='blue') #export to file, plot trades line in blue
##D 
##D # plot order book data from kraken's api
##D order_book <- market.api.process('kraken',c('BTC','EUR'),'order_book')
##D Rbitcoin.plot(order_book)
##D 
##D # plot order book with filtering margins based on order price
##D order_book <- market.api.process('bitmarket',c('BTC','PLN'),'order_book')
##D pct <- 0.75
##D mid <- ((order_book[["asks"]][1,price] + order_book[["bids"]][1,price]) / 2)
##D order_book[["asks"]] <- order_book[["asks"]][price <= mid * (1+pct)]
##D order_book[["bids"]] <- order_book[["bids"]][price >= mid * (1-pct)]
##D Rbitcoin.plot(order_book)
##D 
##D # plot wallet manager data (from local archive) - for details read ?waller_manager
##D wallet_dt <- wallet_manager(archive_write=F, archive_read=T) #readRDS("wallet_archive.rds")
##D Rbitcoin.plot(wallet_dt) # plot in R
##D Rbitcoin.plot(wallet_dt[value>=100 | is.na(value)]) # filter out low value from plot
##D Rbitcoin.plot(wallet_dt, export=T) # export to svg
##D # mask value with ratio value and save to png
##D Rbitcoin.plot(wallet_dt,mask=T,export=T,
##D               export.args=list(format="png",
##D                                width = 2*480,
##D                                height = 2*480,
##D                                units = "px",
##D                                pointsize = 18))
##D # mask value with ratio and mask bitcoin addresses
##D Rbitcoin.plot(wallet_dt[,.SD][location_type=="blockchain",location := "*address*"],
##D               mask=T, export=T)
## End(Not run)



