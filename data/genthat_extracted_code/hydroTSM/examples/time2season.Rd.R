library(hydroTSM)


### Name: time2season
### Title: Date/DateTime character -> Seasonal character
### Aliases: time2season
### Keywords: manip

### ** Examples

## Sequence of daily dates between "1961-01-01" and "1961-12-31"
t <- dip("1961-01-01", "1961-12-31")
time2season(t)

## Sequence of monthly dates between "1961-01-01" and "1961-12-31"
t <- mip("1961-01-01", "1961-12-31")
time2season(t)
time2season(t, out.fmt="seasons")




