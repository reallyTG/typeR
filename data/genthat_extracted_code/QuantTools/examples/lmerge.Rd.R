library(QuantTools)


### Name: lmerge
### Title: Merge list of data.frames into data.table by key column
### Aliases: lmerge

### ** Examples

## No test: 
from = '1990-01-01'
to = '2016-08-30'

symbols = fread( '
               symbol, comment
               EFA, iShares MSCI EAFE Index Fund
               VTI, Vanguard Total Stock Market
               TLT, iShares 20+ Year Treasury Bond
               RWX, SPDR Dow Jones International RelEst
               IEV, iShares Europe
               IEF, iShares 7-10 Year Treasury Bond
               ICF, iShares Cohen & Steers Realty Maj.
               GLD, SPDR Gold Shares
               EWJ, iShares MSCI Japan
               EEM, iShares MSCI Emerging Markets
               DBC, PowerShares DB Commodity Tracking' )

# download historical market data
prices_list = lapply_named( symbols$'symbol', get_yahoo_data, from, to )

# table of close prices
prices = lmerge( prices_list, 'date' , 'close' )

# calculate returns and performance
dates = prices[, date ]
prices[, date := NULL ]
returns = lapply( prices, returns ) %>% setDT
performance = lapply( returns + 1, cumprod ) %>% setDT

# plot historical values
plot_ts( data.table( dates, returns ), legend = 'topleft' )
plot_ts( data.table( dates, prices ), legend = 'topleft' )
plot_ts( data.table( dates, performance ), legend = 'topleft' )

## End(No test)



