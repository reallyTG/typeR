library(pedquant)


### Name: md_stock
### Title: query stock market data
### Aliases: md_stock

### ** Examples

## No test: 
# Example I
# query history prices from yahoo
dt_yahoo1 = md_stock(symbol=c("^GSPC", "000001.SS"))

# FAANG
FAANG = md_stock(c('FB', 'AMZN', 'AAPL', 'NFLX', 'GOOG'), date_range = 'max')

# for Chinese shares
## the symbol without suffix
dt_yahoo2 = md_stock(c("000001", "^000001"))
## the symbol with suffix
dt_yahoo3 = md_stock(c("000001.sz", "000001.ss"))

# split
dt_split = md_stock(symbol=c("AAPL", "000001.SZ", "000001.SS"), 
                    type='split', date_range='max')
# dividend
dt_dividend = md_stock(symbol=c("AAPL", "000001.SZ", "000001.SS"), 
                       type='dividend', date_range='max')

 
# Example II
# query history prices from 163
dt1 = md_stock(symbol=c('600000', '000001', '^000001', '^399001'), 
               source="163")

# valuation ratios (pe, pb, ps)
# only available for stock shares in sse and szse
dt2 = md_stock(symbol=c('600000', '000001', '^000001', '^399001'), 
               source="163", valuation = TRUE)
             
             
# Example III
# query spot prices
dt_spot1 = md_stock(symbol=c('600000.SS', '000001.SZ', '000001.SS', '399001.SZ'), 
                    type='spot', source="163")

# query spot prices of all A shares in sse and szse
dt_spot2 = md_stock(symbol='a', source="163", type='spot')
# query spot prices of all index in sse and szse
dt_spot3 = md_stock(symbol='index', source="163", type='spot')

## End(No test)




