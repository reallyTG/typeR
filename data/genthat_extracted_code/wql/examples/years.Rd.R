library(wql)


### Name: years
### Title: Miscellaneous utility functions
### Aliases: years
### Keywords: manip

### ** Examples


dates <- as.Date(c("1996-01-01", "1999-12-31", "2004-02-29", "2005-03-01"))
date2decyear(dates)

decyear2date(c(1996.0014, 1999.9986, 2004.1626, 2005.1630))

z = c(1,2,3,5,10)  # 5 depths
x = matrix(rnorm(30), nrow = 5)  # 6 variables at 5 depths
layerMean(cbind(z, x))

leapYear(seq(1500, 2000, 100))
leapYear(c(1996.9, 1997))

## Aggregate monthly time series over Feb-Apr only.
aggregate(sfbayChla, 1, meanSub, sub=2:4)

monthNum(as.Date(c('2007-03-17', '2003-06-01')))

## Ignore certain seasons in a Seasonal Kendall test.
c27 <- sfbayChla[, 's27']
seaKen(tsSub(c27))  # Aug and Dec missing the most key data
seaKen(tsSub(c27, seas = c(1:7, 9:11)))

y = Sys.time()
years(y)




