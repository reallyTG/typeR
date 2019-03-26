library(zoo)


### Name: na.locf
### Title: Last Observation Carried Forward
### Aliases: na.locf na.locf0 na.locf.data.frame na.locf.list
###   na.locf.default
### Keywords: ts

### ** Examples

az <- zoo(1:6)

bz <- zoo(c(2,NA,1,4,5,2))
na.locf(bz)
na.locf(bz, fromLast = TRUE)

cz <- zoo(c(NA,9,3,2,3,2))
na.locf(cz)

# generate and fill in missing dates
z <- zoo(c(0.007306621, 0.007659046, 0.007681013,
	0.007817548, 0.007847579, 0.007867313),
	as.Date(c("1993-01-01", "1993-01-09", "1993-01-16",
	"1993-01-23", "1993-01-30", "1993-02-06")))
g <- seq(start(z), end(z), "day")
na.locf(z, xout = g)

# similar but use a 2 second grid

z <- zoo(1:9, as.POSIXct(c("2010-01-04 09:30:02", "2010-01-04 09:30:06",
 "2010-01-04 09:30:07", "2010-01-04 09:30:08", "2010-01-04 09:30:09", 
 "2010-01-04 09:30:10", "2010-01-04 09:30:11", "2010-01-04 09:30:13",
 "2010-01-04 09:30:14")))

g <- seq(start(z), end(z), by = "2 sec")
na.locf(z, xout = g)

## get 5th of every month or most recent date prior to 5th if 5th missing.
## Result has index of the date actually used.

z <- zoo(c(1311.56, 1309.04, 1295.5, 1296.6, 1286.57, 1288.12, 
1289.12, 1289.12, 1285.33, 1307.65, 1309.93, 1311.46, 1311.28, 
1308.11, 1301.74, 1305.41, 1309.72, 1310.61, 1305.19, 1313.21, 
1307.85, 1312.25, 1325.76), as.Date(c(13242, 13244, 
13245, 13248, 13249, 13250, 13251, 13252, 13255, 13256, 13257, 
13258, 13259, 13262, 13263, 13264, 13265, 13266, 13269, 13270, 
13271, 13272, 13274)))

# z.na is same as z but with missing days added (with NAs)
# It is formed by merging z with a zero with series having all the dates.

rng <- range(time(z))
z.na <- merge(z, zoo(, seq(rng[1], rng[2], by = "day")))

# use na.locf to bring values forward picking off 5th of month
na.locf(z.na)[as.POSIXlt(time(z.na))$mday == 5]

## this is the same as the last one except instead of always using the
## 5th of month in the result we show the date actually used

# idx has NAs wherever z.na does but has 1, 2, 3, ... instead of
# z.na's data values (so idx can be used for indexing)

idx <- coredata(na.locf(seq_along(z.na) + (0 * z.na)))

# pick off those elements of z.na that correspond to 5th

z.na[idx[as.POSIXlt(time(z.na))$mday == 5]]

## only fill single-day gaps

merge(z.na, filled1 = na.locf(z.na, maxgap = 1))

## fill NAs in first column by inflating the most recent non-NA
## by the growth in second column.  Note that elements of x-x
## are NA if the corresponding element of x is NA and zero else

m <- zoo(cbind(c(1, 2, NA, NA, 5, NA, NA), seq(7)^2), as.Date(1:7))

r <- na.locf(m[,1]) * m[,2] / na.locf(m[,2] + (m[,1]-m[,1]))
cbind(V1 = r, V2 = m[,2])

## repeat a quarterly value every month
## preserving NAs
zq <- zoo(c(1, NA, 3, 4), as.yearqtr(2000) + 0:3/4)
tt <- as.yearmon(start(zq)) + seq(0, len = 3 * length(zq))/12
na.locf(zq, xout = tt, maxgap = 0)

## na.locf() can also be mimicked with ave()
x <- c(NA, 10, NA, NA, 20, NA)
f <- function(x) x[1]
ave(x, cumsum(!is.na(x)), FUN = f)

## by replacing f() with other functions various generalizations can be
## obtained, e.g.,
f <- function(x) if (length(x) > 3) x else x[1]  # like maxgap
f <- function(x) replace(x, 1:min(length(x)), 3) # replace up to 2 NAs
f <- function(x) if (!is.na(x[1]) && x[1] > 0) x[1] else x  # only positve numbers



