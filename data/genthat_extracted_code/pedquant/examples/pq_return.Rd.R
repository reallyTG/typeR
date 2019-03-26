library(pedquant)


### Name: pq_return
### Title: calculating returns by frequency
### Aliases: pq_return

### ** Examples

## No test: 
#' dts = md_stock(c('000001', '^000001'), source = '163')

# set freq
dts_returns1 = pq_return(dts, freq = 'all')
dts_returns2 = pq_return(dts, freq = 'weekly')

# set method
dts_returns3 = pq_return(dts, freq = 'monthly', method = 'arithmetic') # default method
dts_returns4 = pq_return(dts, freq = 'monthly', method = 'log')
## End(No test)




