library(zoo)


### Name: zooreg
### Title: Regular zoo Series
### Aliases: zooreg frequency.zooreg frequency.zoo deltat.zooreg deltat.zoo
###   cycle.zooreg cycle.zoo as.zooreg as.zooreg.default as.zooreg.ts
###   as.zooreg.its as.zooreg.xts as.ts.zooreg as.zoo.zooreg as.zooreg.zoo
###   index<-.zooreg time<-.zooreg lag.zooreg
### Keywords: ts

### ** Examples

## equivalent specifications of a quarterly series
## starting in the second quarter of 1959.
zooreg(1:10, frequency = 4, start = c(1959, 2))
as.zoo(ts(1:10, frequency = 4, start = c(1959, 2)))
zoo(1:10, seq(1959.25, 1961.5, by = 0.25), frequency = 4)

## use yearqtr class for indexing the same series
z <- zoo(1:10, yearqtr(seq(1959.25, 1961.5, by = 0.25)), frequency = 4)
z
z[-(3:4)]

## create a regular series with a "Date" index
zooreg(1:5, start = as.Date("2000-01-01"))
## or with "yearmon" index
zooreg(1:5, end = yearmon(2000))

## lag and diff (as diff is defined in terms of lag)
## act differently on zoo and zooreg objects!
## lag.zoo moves a point to the adjacent time whereas
## lag.zooreg moves a point by deltat
x <- c(1, 2, 3, 6)
zz <- zoo(x, x)
zr <- as.zooreg(zz)
lag(zz, k = -1)
lag(zr, k = -1)
diff(zz)
diff(zr)

## lag.zooreg wihtout and with na.pad
lag(zr, k = -1)
lag(zr, k = -1, na.pad = TRUE)

## standard methods available for regular series
frequency(z)
deltat(z)
cycle(z)
cycle(z[-(3:4)])

zz  <-  zoo(1:6, as.Date(c("1960-01-29", "1960-02-29", "1960-03-31",
  "1960-04-29", "1960-05-31", "1960-06-30")))
# this converts zz to "zooreg" and then to "ts" expanding it to a daily
# series which is 154 elements long, most with NAs.
## Not run: 
##D length(as.ts(zz)) # 154
## End(Not run)
# probably a monthly "ts" series rather than a daily one was wanted.
# This variation of the last line gives a result only 6 elements long.
length(as.ts(aggregate(zz, as.yearmon, c))) # 6

zzr <- as.zooreg(zz)

dd <- as.Date(c("2000-01-01", "2000-02-01", "2000-03-01", "2000-04-01"))
zrd <- as.zooreg(zoo(1:4, dd))




