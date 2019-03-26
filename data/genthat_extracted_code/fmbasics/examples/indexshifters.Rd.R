library(fmbasics)


### Name: indexshifters
### Title: Index date shifters
### Aliases: indexshifters to_reset to_value to_maturity to_reset.default
###   to_value.default to_maturity.default

### ** Examples

library(lubridate)
to_reset(ymd(20170101) + days(0:30), AUDBBSW(months(3)))
to_value(ymd(20170101) + days(0:30), AUDBBSW(months(3)))
to_maturity(ymd(20170101) + days(0:30), AUDBBSW(months(3)))



