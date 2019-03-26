library(pedquant)


### Name: pq_to_freq
### Title: converting frequency of daily data
### Aliases: pq_to_freq

### ** Examples

## No test: 
dts = md_stock(c("^000001", "000001"), date_range = 'max', source = '163')

dts_weekly = pq_to_freq(dts, "weekly")
## End(No test)




