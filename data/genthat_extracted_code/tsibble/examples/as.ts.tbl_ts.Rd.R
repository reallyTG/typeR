library(tsibble)


### Name: as.ts.tbl_ts
### Title: Coerce a tsibble to a time series
### Aliases: as.ts.tbl_ts

### ** Examples

# a monthly series ----
x1 <- as_tsibble(AirPassengers)
as.ts(x1)

# equally spaced over trading days, not smart enough to guess frequency ----
x2 <- as_tsibble(EuStockMarkets)
head(as.ts(x2, frequency = 260))



