library(popEpi)


### Name: get.yrs
### Title: Convert date objects to fractional years
### Aliases: get.yrs

### ** Examples


data("sire")
sire$dg_yrs <- get.yrs(sire$dg_date)
summary(sire$dg_yrs)

## see: ?as.Date.yrs
dg_date2 <- as.Date(sire$dg_yrs)
summary(as.numeric(dg_date2 - sire$dg_date))

## Epi's cal.yr versus get.yrs
d <- as.Date("2000-01-01")
Epi::cal.yr(d) ## 1999.999
get.yrs(d) ## 2000

## "..." passed on to as.Date, so character / numeric also accepted as input
## (and whatever else as.Date accepts)
get.yrs("2000-06-01")
get.yrs("20000601", format = "%Y%m%d")
get.yrs("1/6/00", format = "%d/%m/%y")

get.yrs(100, origin = "1970-01-01")





