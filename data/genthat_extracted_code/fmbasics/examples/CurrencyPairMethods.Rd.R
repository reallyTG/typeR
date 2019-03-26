library(fmbasics)


### Name: CurrencyPairMethods
### Title: CurrencyPair methods
### Aliases: CurrencyPairMethods is_t1 to_spot to_spot_next to_forward
###   to_today to_tomorrow to_fx_value invert

### ** Examples

library(lubridate)
is_t1(AUDUSD())
dts <- lubridate::ymd(20170101) + lubridate::days(0:30)
to_spot(dts, AUDUSD())
to_spot_next(dts, AUDUSD())
to_today(dts, AUDUSD())
to_tomorrow(dts, AUDUSD())
to_fx_value(dts, months(3), AUDUSD())



